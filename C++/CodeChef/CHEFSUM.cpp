#include <bits/stdc++.h>

using namespace std;

int a,n,mini,mina;
int main()
{
    int test;
    scanf("%d",&test);
    while(test--){
        mini = 1;
        scanf("%d",&n);
        mina = 1000006;
        for(int i=1;i<=n;i++){
            scanf("%d",&a);
            if(a<mina){
                mini = i;
                mina = a;
            }
        }
        printf("%d\n",mini);

    }
}
