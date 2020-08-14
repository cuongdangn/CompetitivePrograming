
/*
    Interval tree (no lazy update )
*/
#include <bits/stdc++.h>

using namespace std;

const int MAXN = 50005;


struct Node{
    int key;
    Node(){
        key = 0;
    }
    Node(int k){
        key = k;
    }
    bool operator>(const Node otherN)const {
        return key > otherN.key;
    }

    bool operator<(const Node otherN)const {
        return key < otherN.key;
    }
    Node operator+(const Node otherN)const {
        return Node(key+otherN.key);
    }

};
struct ITree{
    int size_;
    int add[4*MAXN+5];
    Node it[4*MAXN+5];

    ITree(){
        size_ = 0;
    }
    ITree(int sz){
        size_ = sz;
    }

    void build(const int a[],int i,int l,int r,Node ff(Node,Node)){  //ff truyen ham vao nhu max or min
        if(l>r) return;
        if(l==r){
            it[i].key=a[l];
            return;
        }
        int mid = (l+r)/2;
        build(a,i*2,l,mid,ff);
        build(a,i*2+1,mid+1,r,ff);
        it[i]=ff(it[i*2],it[i*2+1]);
    }
    void updatefor_(int k){
        it[k*2].key += add[k];
        it[k*2+1].key +=add[k];
        add[k*2]+=add[k];
        add[k*2+1]+=add[k];
        add[k]=0;
    }
    void update(int k,int l,int r,int i,int j,Node ff(Node,Node),int t){ //ff truyen ham vao, tang tu i den j t don vi
        if(l>=i && r<=j) {
            it[k].key+=t;
            add[k]+=t;
            return;
        }
        int mid = (l+r) / 2;
        updatefor_(k);
        if(j<=mid) update(k*2,l,mid,i,j,ff,t);
         else if(i>=mid+1) update(k*2+1,mid+1,r,i,j,ff,t);
          else{
            update(k*2,l,mid,i,j,ff,t);
            update(k*2+1,mid+1,r,i,j,ff,t);
          }
        it[k]=ff(it[k*2],it[k*2+1]);
    }
    Node get(int k,int l,int r,int i,int j,Node ff(Node,Node)){ //ff truyen ham vao
        if(l>=i && r<=j) return it[k];
        int mid = (l+r) / 2;
        updatefor_(k);
        if(j<=mid) return get(k*2,l,mid,i,j,ff);
        if(i>=mid+1) return get(k*2+1,mid+1,r,i,j,ff);
        Node left = get(k*2,l,mid,i,j,ff);
        Node right = get(k*2+1,mid+1,r,i,j,ff);
        return ff(left,right);
    }

};
Node ffmin(Node a,Node b){
    return (a>b)?b:a;
}
Node ffmax(Node a,Node b){
    return (a<b)?b:a;
}

int a[MAXN];
int n,m;
ITree it;
int main()
{
    //freopen("code.in","r",stdin);
    cin >> n >>m;
    it.build(a,1,1,n,ffmax);
    for(int i=1;i<=m;i++){
        int c;
        cin >> c;
        if(!c){
            int u,w,v;
            cin >> u >> v >>w;
            it.update(1,1,n,u,v,ffmax,w);
        }
        else {
            int u,v;
            cin >> u >> v;
            cout << it.get(1,1,n,u,v,ffmax).key<<endl;
        }
    }
}

