//https://en.wikipedia.org/wiki/Carmichael_function
#include<cstdio>
#include<iostream>
#include <cassert>

using namespace std;
int a,b;
int luu[20];
int poww(int a, int b, const int m) {
  int res = 1;
  while (b) {
    if (b & 1) res = 1ll * res * a % m;
    a = 1ll * a * a % m;
    b >>= 1;
  }
  return res;
}
/*int poww(int aa, int bb, int m) {
    if(bb==0)return 1;
    long long tg=poww(aa,bb/2,m);
    tg=tg*tg%m;
    if(bb%2==1)tg=(long long)tg*aa%m;
    return tg;
}*/
int tinh(int a,int b,int c)
{
    int tg=0;
    int x=0;
    bool ok=false;
    if(b==1) tg=a;else if(c==0)tg=a%luu[c];
    else {
            x=tinh(a,b-1,c-1);
            long long tg1=1;
            for(int i=1;i<=x;i++){
                    tg1=tg1*a;
                    if(tg1<=0||tg1>luu[c]){
                        ok=true;
                        break;
                    }
            }
            if(ok)tg=poww(a,x,luu[c]);
            else tg=tg1;
        }
   // cout<<a<<" "<<b<<" "<<luu[c]<<" "<<c<<" "<<tg<<" "<<x<<endl;
   //if (ok==false)cout<<a<<" "<<b<<" "<<luu[c]<<" "<<c<<" "<<tg<<" "<<x<<endl;
    while(tg<27&&ok)tg=tg+luu[c];
    //if (ok==false)cout<<a<<" "<<b<<" "<<luu[c]<<" "<<c<<" "<<tg<<" "<<x<<endl;
    return tg;
}
int main()
{
    //freopen("code.in","r",stdin);
    //freopen("code1.ou","w",stdout);
    luu[12]=100000000;
    luu[11]=20000000;
    luu[10]=4000000;
    luu[9] =800000;
    luu[8] =160000;
    luu[7] =32000;
    luu[6] =6400;
    luu[5] =1280;
    luu[4] =256;
    luu[3] =64;
    luu[2] =16;
    luu[1] =4;
    luu[0] =2;

    while (~scanf("%d %d", &a, &b)) {
    assert(a > 0 && b > 0);
        int kq=tinh(a,b,12);
        kq=kq%luu[12];
        //cout<<kq<<endl;
        int sl=0;
        if(kq==0)sl=1;
        else for (int tmp = kq; tmp; tmp /= 10) ++sl;
        sl=8-sl;
        while(sl--)putchar('0');
        printf("%d\n",kq);
    }
}
