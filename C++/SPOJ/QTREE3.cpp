
#include <bits/stdc++.h>

using namespace std;

struct Node{
    int key;
    int add;
    Node* left;
    Node* right;
    Node(){
        key = 0;
        add = 0;
    }
    Node(int k){
        key = k;
        add = 0;
    }
    bool operator>(const Node* otherN)const {
        return key > otherN->key;
    }

    bool operator<(const Node* otherN)const {
        return key < otherN->key;
    }
    Node operator+(const Node* otherN)const {
        return Node(key+otherN->key);
    }

};
struct ITree{
    Node* root;
    ITree(){
        root = NULL;
    }
    Node* build(int*,int,int,Node* ff(Node*,Node*));
    Node* build(int,int,Node* ff(Node*,Node*),int);
    void updatefor_(Node*);
    void update(Node*,int,int,int,int,Node* ff(Node*,Node*),int);
    Node* get(Node*,int,int,int,int,Node* ff(Node*,Node*));

};
Node* ITree::build(int *a,int l,int r,Node* ff(Node*,Node*)){  //ff truyen ham vao nhu max or min
        //cout << a << endl;
     //   if(l>r) return NULL;
        Node* newNode = new Node();
        if(l==r){
            newNode->key=*(a+l-1);
            newNode->add = 0;
            newNode->left = NULL;
            newNode->right = NULL;
            return newNode;
        }
        int mid = (l+r)/2;
        newNode->left = build(a,l,mid,ff);
        newNode->right=build(a,mid+1,r,ff);
        newNode->key=ff(newNode->left,newNode->right)->key;
        newNode->add = 0;
        return newNode;
}
Node* ITree::build(int l,int r,Node* ff(Node*,Node*),int t){  //ff truyen ham vao nhu max or min
        //cout << a << endl;
       // if(l>r) return NULL;
        Node* newNode = new Node();
        if(l==r){
            newNode->key=t;
            newNode->add = 0;
            newNode->left = NULL;
            newNode->right = NULL;
            return newNode;
        }
        int mid = (l+r)/2;
        newNode->left = build(l,mid,ff,t);
        newNode->right=build(mid+1,r,ff,t);
        newNode->key=ff(newNode->left,newNode->right)->key;
        newNode->add = 0;
        return newNode;
}
void ITree::updatefor_(Node *k){
    if(k->left!=NULL){
        k->left->key += k->add;
        k->left->add += k->add;
    }
    if(k->right !=NULL){
        k->right->key += k->add;
        k->right->add += k->add;
    }
    k->add = 0;
}
void ITree::update(Node* k,int l,int r,int i,int j,Node* ff(Node*,Node*),int t){ //ff truyen ham vao, tang tu i den j t don vi
        if(l>=i && r<=j) {
            k->key+=t;
            k->add+=t;
            return;
        }
        int mid = (l+r) / 2;
        updatefor_(k);
        if(j<=mid) update(k->left,l,mid,i,j,ff,t);
         else if(i>=mid+1) update(k->right,mid+1,r,i,j,ff,t);
          else{
            update(k->left,l,mid,i,j,ff,t);
            update(k->right,mid+1,r,i,j,ff,t);
          }
        k->key=ff(k->left,k->right)->key;
}
Node* ITree::get(Node* k,int l,int r,int i,int j,Node* ff(Node*,Node*)){ //ff truyen ham vao
      //  cout << k->key <<" "<<l<<" "<<r<<endl;
        if(l>=i && r<=j) return k;
        int mid = (l+r) / 2;
        updatefor_(k);
        if(j<=mid) return get(k->left,l,mid,i,j,ff);
        if(i>=mid+1) return get(k->right,mid+1,r,i,j,ff);
        Node* left = get(k->left,l,mid,i,j,ff);
        Node* right = get(k->right,mid+1,r,i,j,ff);
        return ff(left,right);
}

Node* ffmin(Node* a,Node* b){
    return (a->key>b->key)?b:a;
}
Node* ffmax(Node* a,Node* b){
    return (a->key<b->key)?b:a;
}

const int N = 100005;
struct egde{
    int u,v;
    int w;
};

ITree it;
vector<int> adj[N];
int base[N];
int parent[N];
int nChild[N];
int chainHead[N], chainInd[N], posInBase[N];
int n,nChain, nBase,q;
int aa[N];

void input()
{
    scanf("%d%d",&n,&q);
    int u,v;
    for(int i=1;i<=n-1;i++){
            scanf("%d%d",&u,&v);
            adj[v].push_back(u);
            adj[u].push_back(v);
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
    base[posInBase[u]] = u;

	int mxVtx = -1;

    int m = adj[u].size();
	for (int i = 0; i < m; i++) {
		int v = adj[u][i];
		if (v != parent[u]) {
			if (mxVtx == -1 || nChild[v] > nChild[mxVtx]) {
				mxVtx = v;
			}
		}
	}

	if (mxVtx > -1)
		hld(mxVtx);


	for (int i = 0; i < adj[u].size(); i++) {
		int v = adj[u][i];
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
    nChain = 0;
    nBase = 0;
    dfs(1);
    hld(1); // heavy light Decomposition

}

void solve1(int u)
{
    int t = n+2;
   /* for(int i=1;i<=n;i++)
    cout << base[i]<<" ";
    cout << endl;
    */
    while(u>0){
        int i = chainInd[u];
        t = min(t,it.get(it.root,1,n,posInBase[chainHead[i]],posInBase[u],ffmin)->key);
        u = parent[chainHead[i]];
    }
    if(t==n+2)
        printf("-1\n");
    else
        printf("%d\n",base[t]);
}
void solve()
{
    init();
    it.root = it.build(1,n,ffmin,n+2);

    int l,u,t;
    for(int i=1;i<=q;i++){
        scanf("%d%d",&l,&u);

        if(l==0){
            if(aa[u]==0){
                t = posInBase[u]-n-2;
                aa[u] = 1;
            }
            else{
                t = -posInBase[u]+n+2;
                aa[u] = 0;
            }
         //   cout << posInBase[u] <<" "<<t<< endl;
            it.update(it.root,1,n,posInBase[u],posInBase[u],ffmin,t);
        }
        else
            solve1(u);
    }
}

int main()
{
       // freopen("code.in","r",stdin);
        input();
        solve();

}
