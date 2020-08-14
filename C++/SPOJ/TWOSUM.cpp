#include<iostream>
#include<cmath>
#include<cstdio>



using namespace std;

int n,a[5001];
int kq=0;

int main()
{
    scanf("%d",&n);
    for(int i=1;i<=n;i++)
        scanf("%d",&a[i]);
    for(int i=1;i<=n-1;i++)
    {
        int k=i;
        int tr=a[i];
        int ph=0;
        for(int j=i+1;j<=n;j++)
        {
            ph=ph+a[j];
            while(k<j&&tr<ph)
            {
              k+=1;
              tr=tr+a[k];
              ph=ph-a[k];
            }
            if(tr==ph)kq=max(kq,j-i+1);
        }
    }
    printf("%d",kq);

}
