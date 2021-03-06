#include<bits/stdc++.h>

#define MAXN 100001

using namespace std;
typedef long long ll;

int c[100100];
vector<int> adj[100100];

ll dfs(int a,int p) {
	vector<ll> t;
	int s=0;
	for(int i=0;i<adj[a].size();i++) {
		int b=adj[a][i];
		if(p!=b && c[b]) {
			c[b]--;
			t.push_back(dfs(b,a));
			s+=c[b];
		}
	}
	sort(t.begin(),t.end());
	ll r=0;
	while(c[a] && t.size()) {
		r+=t.back()+2;
		c[a]--;
		t.pop_back();
	}
	int y=min(c[a],s);
	r+=y*2;
	c[a]-=y;
	s-=y;
	return r;
}
int main() {
    freopen("tree.inp","r",stdin);
    freopen("tree.out","w",stdout);
	int n;
	cin>>n;
	for(int i=1;i<=n;i++) {
		cin>>c[i];
	}
	for(int i=0;i<n-1;i++) {
		int a,b;
		cin>>a>>b;
		adj[a].push_back(b);
		adj[b].push_back(a);
	}
	int s;
	cin>>s;
	cout<<dfs(s,-1);
}
