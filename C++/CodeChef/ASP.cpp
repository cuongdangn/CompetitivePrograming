#include<iostream>
#include<algorithm>
#include<cstdio>

using namespace std;

typedef pair<int, int> ii;
#define X first
#define Y second

ii  a[1000005];
int n;

int main()
{
    int t;
    scanf("%d",&t);
    for(int i=1;i<=t;i++){
        scanf("%d",&n);
        for(int i=1;i<=n;i++){
                scanf("%d",&a[i].X);
                a[i].Y=i;
        }
        sort(a+1,a+n+1);
        bool ok=true;
        for(int i=1;i<=n;i++)
        if(abs(a[i].Y-i)>1){
            ok=false;
            break;
        }
        if(ok)printf("YES\n");
        else printf("NO\n");

    }
}
