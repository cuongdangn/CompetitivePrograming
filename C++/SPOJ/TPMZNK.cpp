#include <iostream>
#include <cmath>
#include <cstdio>
#include <string>

using namespace std;

#define base 15111992
string a,b;

int tinh(string a)
{
    int n=a.size();
    int tg=0;
    int lt=0;
    int x;
    init(a);
    for(int i=n-1;i>=0;i--)
    {

    }
}
int main()
{
      for(int i=1;i<=201;i++)
        lt[i]=(lt[i-1]*2)%base;
      cin>>a;
      cin>>b;
      n=a.length();
      kq=tinh(b)-tinh(a);
      kq=(kq+base)%base;
      printf("%d",kq);
}
