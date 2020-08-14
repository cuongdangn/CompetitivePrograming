#include<iostream>
#include<cstdio>
#include<cstring>

using namespace std;

#define base 3210121

int l1,muc;
int l2,n;

int d[2][510][510];
char s1[510],s2[510];
char luu[2000];
int duyet(int x,int i,int j)
{
    int dem=0;
    if(i>0||j>0){
    if(x==0&&i+j>muc&&s1[i]!=luu[n+1-i-j])return 0;
    if(x==1&&i+j>muc&&s2[j]!=luu[n+1-i-j])return 0;
    }
    if(i==l1&&j==l2){
         //  for(int i=1;i<=n;i++)cout<<luu[i];
       // cout<<endl;
            return 1;
    }

   // if(d[x][i][j]!=-1&&i+j<=muc)
  //  {
        // for(int i=1;i<=n;i++)cout<<luu[i];
       //cout<<d[x][i][j]<<" "<<i<<" "<<x<<" "<<j<<endl;
       // return d[x][i][j];
   // }
    if(i<l1) {
            luu[i+j+1]=s1[i+1];
            dem=(dem+duyet(0,i+1,j))%base;
        }
    if(j<l2) {
            luu[i+j+1]=s2[j+1];
            dem=(dem+duyet(1,i,j+1))%base;
    }
    luu[i+j+1]=' ';
    d[x][i][j]=dem;
    return dem;

}
int main()
{
   // freopen("code.in","r",stdin);
    scanf("%s %s",s1,s2);
   //printf("%s %s",s1,s2);

    int kq;
    l1=strlen(s1);
    l2=strlen(s2);
    for(int i=l1;i>=1;i--)
        s1[i]=s1[i-1];
    for(int i=l2;i>=1;i--)
        s2[i]=s2[i-1];
    for(int i=0;i<=l1;i++)
    for(int j=0;j<=l2;j++){
        d[0][i][j]=-1;
        d[1][i][j]=-1;
    }
    n=l1+l2;
    muc=n/2;
    kq=duyet(0,0,0);
   /* for(int i=0;i<=l1;i++)
    for(int j=0;j<=l2;j++){
        cout<<i<<" "<<j<<" "<<d[0][i][j]<<" "<<d[1][i][j]<<endl;
    }*/
    printf("%d",kq);
}
