#include<cstdio>
#include<iostream>
#include<cmath>

using namespace std;

#define foru(i,a,b) for(int i=a;i<=b;i++)

int n,m;
int dd[100001];
int xuly()
{
    foru(i,1,n)dd[i]=0;
    int i=1;

    int x=1;
    int dem=0;
    foru(j,1,n){
        if(dd[i]==1){
                //cout<<i<<endl;
                break;
            }
        else dd[i]=1;
        if(i<=n-m)x=i+m;else x=i-n+m;
        i=x;
        dem++;
    }
    if(dem<n)cout<<"No "<<dem<<"\n";//<<" "<<m<<"\n";
   else cout<<"Yes\n";

}
int main()
{
    freopen("codec.in","r",stdin);
     freopen("codec1.ou","w",stdout);
    int t;
    scanf("%d",&t);
    foru(i,1,t){
        scanf("%d%d",&n,&m);
        xuly();
    }
}
