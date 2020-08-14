#include<bits/stdc++.h>

using namespace std;

struct bg
{
    int g,l,r;
};
bg it[40006];
int cn[40006];
int n;
int m;
int buil(int x,int l,int r)
{
    cn[x]=-1;
    if(l==r){
        it[x].r=it[x].l=it[x].g=1;
        return 0;
    }
    int m=(l+r)/2;
    buil(x*2,l,m);
    buil(x*2+1,m+1,r);
    it[x].g=r-l+1;
    it[x].l=r-l+1;
    it[x].r=r-l+1;
}
int capnhap(int x,int l,int r)
{
    int m=(l+r)/2;
    cn[x*2]=cn[x];
    cn[x*2+1]=cn[x];
    it[x*2].r=it[x*2].l=it[x*2].g=(m-l+1)*cn[x];
    it[x*2+1].r=it[x*2+1].l=it[x*2+1].g=(r-m)*cn[x];
    cn[x]=-1;
}
int up(int x,int l,int r,int li,int ri,int t)
{
    if(r<li||l>ri)return 0;
    if(li<=l&&ri>=r){
        cn[x]=t;
        it[x].r=it[x].l=it[x].g=(r-l+1)*t;
        return 0;
    }
    if(cn[x]!=-1)capnhap(x,l,r);
    int m=(l+r)/2;
    up(x*2,l,m,li,ri,t);
    up(x*2+1,m+1,r,li,ri,t);
    it[x].g=max(it[x*2].g,max(it[x*2+1].g,it[x*2].r+it[x*2+1].l));
    it[x].l=(it[x*2].g==m-l+1)?m-l+1+it[x*2+1].l:it[x*2].l;
    it[x].r=(it[x*2+1].g==r-m)?it[x*2].r+r-m:it[x*2+1].r;
}
int main()
{
   // freopen("code.in","r",stdin);
    scanf("%d%d",&n,&m);
    buil(1,1,n);
    while(m--){
        int t,x,y;
        scanf("%d",&t);
       // cout<<t;
        if(t==3)printf("%d\n",it[1].g);
        else{
            scanf("%d%d",&x,&y);
            if(t==2)up(1,1,n,x,y,0);
            else up(1,1,n,x,y,1);
        }
    }

}
