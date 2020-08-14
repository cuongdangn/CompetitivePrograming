#include <bits/stdc++.h>

using namespace std;

int n,m;
long long minSalary[1005],offeredSalary[1005];
bool qual[1005][1005];
int  maxJobOffers[1005];
int dd[1005];
char s[1005];
void input()
{
    scanf("%d%d",&n,&m);
    for(int i=1;i<=n;i++)
        scanf("%d",&minSalary[i]);
    for(int i=1;i<=m;i++){
        dd[i] = 0;
        scanf("%d%d",&offeredSalary[i],&maxJobOffers[i]);
    }
    for(int i=1;i<=n;i++){
        scanf("%s",s);
        //cout << s<<endl;
        for(int j=1;j<=m;j++)
            if(s[j-1] == '0')
                qual[i][j] = false;
            else
                qual[i][j] = true;

    }
}
void solve()
{
    int kq1 = 0;
    int kq3 = 0;
    long long kq2 = 0;
    for(int i=1;i<=n;i++){
        int maxx = 0;
        for(int j=1;j<=m;j++)
            if(maxJobOffers[j]!=0 && qual[i][j] && offeredSalary[j] >= minSalary[i])
                if(offeredSalary[j] > offeredSalary[maxx])
                    maxx = j;
        if(maxx!=0){
            kq1++;
            kq2+= offeredSalary[maxx];
            maxJobOffers[maxx]--;
            dd[maxx] = 1;
        }
    }
    for(int i=1;i<=m;i++)
        if(dd[i]==0)
            kq3++;
    printf("%d %lld %d\n",kq1,kq2,kq3);
}
int main()
{
    freopen("code.in","r",stdin);
    int test;
    scanf("%d",&test);
    while(test--){
        input();
        solve();
    }
}

