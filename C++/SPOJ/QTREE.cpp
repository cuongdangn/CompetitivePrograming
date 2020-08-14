#include <bits/stdc++.h>

using namespace std;

#define ii pair<int ,int>

const int N = 10005;
const int MAXN = N;
struct edge{
    int u,v;
    int w;
};

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


vector<edge> adj[N];
int parent[N];
int nChild[N];
int chainHead[N], chainInd[N], posInBase[N];
int n,nChain, nBase;
ITree it;
int d[N];

void input()
{
    scanf("%d",&n);
    int u,v,w;
    edge tmp;
    for(int i=1;i<=n;i++)
        adj[i].clear();
    for(int i=1;i<=n-1;i++){
        scanf("%d%d%d",&tmp.u,&tmp.v,&tmp.w);
        ca.push_back(tmp);
        adj[tmp.u].push_back(i-1);
        adj[tmp.v].push_back(i-1);
       // adj[u].push_back(ii(u,w));
       // adj[v].push_back(ii(v,w));
    }
}
void dfs(int a)
{
    int m = adj[a].size();
    for(int i=0;i<m;i++){
        int u = adj[a][i];
        if(parent[u] ==0){
            parent[u] = a;
            dfs(u);
            nChild[a] += nChild[u];
        }
    }
    nChild[a]++;
}
void hld(int u) {


	if (chainHead[nChain] == 0) chainHead[nChain] = u;


	chainInd[u] = nChain;


	posInBase[u] = ++nBase;


	int mxVtx = -1;

    int m = adj[u].size();
	for (int i = 0; i < m; i++) {
		int v = adj[u][i].u+adj[u][i].v - u;
		if (v != parent[u]) {
			if (mxVtx == -1 || nChild[v] > nChild[mxVtx]) {
				mxVtx = v;
			}
		}
	}

	if (mxVtx > -1){
		hld(mxVtx);


	for (int i = 0; i < adj[u].size(); i++) {
		int v = adj[u][i].first;
		if (v != parent[u] && v != mxVtx) {
			nChain++;
			hld(v);
		}
	}
}
void init()
{
     for(int i=1;i<=n;i++){
        parent[i] = 0;
        nChild[i] = 0;
        posInBase[i] = 0;
        chainHead[i] = 0;
    }
    parent[1] = -1;
    dfs(1);
    hld(1); // heavy light Decomposition
    //build(1,1,n);
}
int LCA(int u, int v)
{
    while(chainInd[u] != chainInd[v]){
        if(posInBase[u] < posInBase[v])
            v = parent[chainHead[chainInd[v]]];
        else
            u = parent[chainHead[chainInd[u]]];
    }
    if(posInBase[u]>posInBase[v])
        return v;
    return u;
}
void solve()
{
    init();
}
int main()
{
    int test;
    scanf("%d",&test);
    while(test--){
        input();
        solve();
    }
}
