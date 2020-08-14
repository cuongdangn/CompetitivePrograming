#include <bits/stdc++.h>

using namespace std;

int n,m;
int a[102][102];
char c[101][101];

bool ktra()
{

}
int chat()
{
    int da,cu,giu;
    da=0;
    cu=1000000000;
    while(da<=cu){
        giu=(da+cu)/2;
        if(kt(giu)){
            luu=giua;
            cu=giu-1;
        }else da=giu+1;
    }
    printf("%d",luu);
}
int main()
{
    scanf("%d%d",&m,&n);
    for(int i=1;i<=m;i++)
        scanf("%s\n",c[i]);
    for(int i=1;i<=m;i++)
        for(int j=1;j<=n;j++)
         scanf("%d",&a[i]);
    chat();
}
