#include <bits/stdc++.h>

using namespace std;

#define FOR(i,a,b) for(int i=a;i<=b;i++)

int n,m,l;
int it[200006];
int cn[200006];
int a[50005],b[50005];
int buil(int x,int l,int r)
{
    cn[x]=-1;
    if(l==r){
            it[x]=b[l];
            return 0;
    }
    int m=(l+r)/2;
    buil(x*2,l,m);
    buil(x*2+1,m+1,r);
    it[x]=it[x*2]+it[x*2+1];
}
int capnhap(int x,int l,int r)
{
    cn[x*2]=cn[x];
    int m=(l+r)/2;
    it[x*2]=cn[x]*(m-l+1);
    cn[x*2+1]=cn[x];
    it[x*2+1]=cn[x]*(r-m);
    cn[x]=-1;
}
int up(int x,int l,int r,int li,int ri,int t)
{
    if(r<li||l>ri)return 0;
    if(li<=l&&ri>=r){
        it[x]=t*(r-l+1);
        cn[x]=t;
        return 0;
    }
    int m=(l+r)/2;
    if(cn[x]!=-1)capnhap(x,l,r);
    up(x*2,l,m,li,ri,t);
    up(x*2+1,m+1,r,li,ri,t);
    it[x]=it[x*2]+it[x*2+1];
}
int main()
{
   // freopen("code.in","r",stdin);
    scanf("%d%d",&n,&m);
    FOR(i,1,n){
        scanf("%d",&a[i]);
        l+=a[i];
    }
    int z=a[1];
    int i=1;
    int j=1;
    while(i<=l-1){
        if(i<z){
                b[i]=1;
                i=i+1;
        }
        else {
            b[i]=0;
            i=i+1;
            j+=1;
            z=z+a[j];
        }

    }
    buil(1,1,l-1);
    ////////////
    char c;
    //cout<<m;
    scanf("\n");
    while(m--){
        scanf("%c",&c);
       // cout<<c;
        if(c=='C'){
                scanf("\n");
                printf("%d\n",l-it[1]);}
        else{
                int x,y,t;
            scanf("%d%d\n",&x,&y);
            if(c=='J')t=1;else t=0;
            up(1,1,l-1,x,y-1,t);
        }
    }
}
