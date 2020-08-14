#include <cmath>
#include <cstdio>
#include <iostream>

#define N 100005

using namespace std;

int s[N], a[N];

int main()
{
    //freopen("code.in","r",stdin);
    int tt;
    for (scanf("%d", &tt); tt--; ) {
   int n;
   scanf("%d", &n);
   int v = 0;
   for (int i = 1; i <= n; ++i) scanf("%d", s + i);
   for (int i = 1; i <= n; ++i) scanf("%d", a + i);
   for (int i = 1; i <= n; ++i)
       v ^= s[i] % (a[i]+1);
   if(v!=0)printf("Jerry \n");else  printf("Tom \n");
 }
}
