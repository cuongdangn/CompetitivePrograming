#include<iostream>
#include<cstdio>
#include<algorithm>

using namespace std;

#define m 10
#define ma 1024
#define base 1000000007
char s[11];
int d[ma][ma][2];
int dd[ma];
int mau[10],thay[10];
int n,bd;

int xuly()
{
    for(int i=0;i<ma;i++)
        for(int j=0;j<ma;j++) {
                d[i][j][0]=0;
                d[i][j][1]=0;
        }

    d[0][bd][1]=1;
    d[0][bd][0]=1;

    for(int i=0;i<ma;i++)
        for(int j=0;j<ma;j++){
        int p=dd[i]/2;
        if(dd[i]>0)p++;
        d[i+1][j][0]=(d[i+1][j][0]+d[i][j][0]*p% base)%base;
        d[i+1][j][1]=(d[i+1][j][1]+d[i][j][0]*p% base) %base;
        if(dd[i]>0){
                d[i+1][j & i][0]=(d[i+1][j & i][0]+d[i][j][1]*(dd[i]-dd[i]/2)%base)%base;
                d[i+1][j & i][1]=(d[i+1][j & i][1]+d[i][j][1]*(dd[i]-dd[i]/2)%base)%base;
        }
    }
    int kq=0;
    for(int i=0;i<m;i++)
        kq=(kq+d[i][1023][1])%base;
        cout<<kq<<endl;

}
int main()
{
    freopen("code.in","r",stdin);
    int t;
    scanf("%d",&t);
    while(t--){
        scanf("%s",s);
        bd=0;
        int x=1;
        for(int i=0;i<m;i++){
            if(s[i]=='w')mau[i]=0;else mau[i]=1;
            bd=bd+mau[i]*x;
            x=x*2;
        }
        scanf("%d",&n);
        for(int i=0;i<=ma;i++)dd[i]=0;
        for(int i=1;i<=n;i++){
            scanf("%s",s);
            int t=0;
            int x=1;
            for(int j=m-1;j>=0;j--){
                if(s[i]=='+')thay[j]=1;else thay[j]=0;
                t=t+x*thay[j];
                x=x*2;
            }
            dd[t]++;
        }
        xuly();
    }
}

