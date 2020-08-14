#include<cstdio>
#include<iostream>

using namespace std;
int a,b;
int luu[20];
int poww(int aa, int bb, int m) {
  long long res = 1;
  long long a,b;
  a=aa;
  b=bb;
  a=a%m;
  while (b) {
    if (b & 1) res = 1ll * res * a % m;
    a = 1ll * a * a % m;
    b >>= 1;
  }
  return res;
}
int tinh(int a,int b,int c)
{
    int tg;
    int x=0;
    if(b==1) tg=a%luu[c];
    else {
            x=tinh(a,b-1,c-1);
            //if(x==0)return 0;
            tg=poww(a,x,luu[c]);
        }
    //cout<<a<<" "<<b<<" "<<luu[c]<<" "<<tg<<" "<<x<<endl;
    return tg;
}
int main()
{
    //freopen("code.in","r",stdin);
    luu[15] =100000000;
    luu[14] =40000000;
    luu[13] =16000000;
    luu[12] =6400000;
    luu[11] =2560000;
    luu[10] =1024000;
    luu[9]  =409600;
    luu[8]  =163840;
    luu[7]  =65536;
    luu[6]  =32768;
    luu[5]  =16384;
    luu[4]  =8192;
    luu[3]  =4096;
    luu[2]  =2048;
    luu[1]  =1024;
    luu[0]  =512;
    for(int i=0;i<=14;i++)
        luu[i]=luu[i]/2;
    while(scanf("%d",&a)!=EOF){
        scanf("%d",&b);
        if(b>=13)b=13;
        int kq=tinh(a,b,15);
        int sl=0;
        if(kq==0)sl=1;
        else for (int tmp = kq; tmp; tmp /= 10) ++sl;
        sl=8-sl;
        while(sl--)putchar('0');
        printf("%d\n",kq);
    }
}
