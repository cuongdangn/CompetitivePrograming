#include<iostream>
#include<algorithm>
#include<cstdio>

using namespace std;

typedef pair<int, int> ii;
#define X first
#define Y second

int  a[1000005];
int n;

int main()
{
    int t;
    scanf("%d",&t);
    for(int i=1;i<=t;i++){
        scanf("%d",&n);
        for(int i=1;i<=n;i++)
                scanf("%d",&a[i]);


        int max1,max2;
        max1=-1;
        max2=-1;
        bool ok=true;
        for(int i=1;i<=n;i++)
         if(a[i]<max2){ok=false;break;}
         else{
            if(a[i]>max1){
                max2=max1;
                max1=a[i];
            }else max2=a[i];
         }
        if(ok)printf("YES\n");
        else printf("NO\n");

    }
}

