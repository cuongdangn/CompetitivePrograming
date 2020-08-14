#include <bits/stdc++.h>

using namespace std;

int n,l,sl,ll,to;
int luu[102],a[25];
int dd[25];
int xuat()
{

    int i=1;
    sl++;
    //cout<<sl<<" ";
    while(i<=l){
    if(luu[i]!=0)
         for(int j=1;j<=a[luu[i]];j++)printf("%d ",luu[i]);
         else printf("0 ");
         i=i+a[luu[i]];
    }
    printf("\n");
}
int duyet(int x,int co)
{
    if(x>=l+1){
            if(ll==n){xuat();return 0;}else return 0;
            //cout<<1;
    }
    if(l-x+1<to-co||sl==1000){return 0;}
    int da;
    if(x==1)da=1;else da=0;
    for(int i=da;i<=n;i++)
    if(dd[i]==0){
            int xx=0;
        if(i!=0){dd[i]=1;ll++;xx=a[i];}
        luu[x]=i;
        duyet(x+a[i],co+xx);
        if(i!=0){dd[i]=0;ll--;}
    }
}
int main()
{
    //freopen("code.in","r",stdin);
    scanf("%d%d",&l,&n);
    for(int i=1;i<=n;i++){
            scanf("%d",&a[i]);
            to+=a[i];
    }
    a[0]=1;
    duyet(1,0);
}
