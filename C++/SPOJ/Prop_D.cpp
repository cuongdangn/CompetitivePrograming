#include<iostream>
#include<cstdio>
#include<algorithm>
#include<string>

using namespace std;

string s;
struct dau
{
    int cs,lev;
    string gt;
};

struct so
{
    int cs,lev;
    int gt;
};
int n,m1,m2;
so a[10000];
dau b[10000];

bool ktso(char s)
{
    int x=int(s);
    x=x-48;
    if(x>=0&&x<=9)return true;
    return false;
}
int doc()
{
    string s;
    for(int i=1;i<=n;i++)
    {
        cin>>s;
        int xx;
        xx=s.length();
        if(ktso(s[xx-1]))
        {
            m1++;
            a[m1].lev=xx;
            a[m1].cs=i;
            a[m1].gt=int(s[xx-1])-48;
        }
        else{
            m2++;
            b[m2].lev=xx;
            b[m2].cs=i;
            b[m2].gt=s[xx-1];
        }
    }
}
bool cmp1(so i,so j)
{
    return((i.lev<j.lev)||(i.lev==j.lev&&i.cs<j.cs));
}
bool cmp2(dau i,dau j)
{
    return((i.lev<j.lev)||(i.lev==j.lev&&i.cs<j.cs));
}
int xuly()
{
    cout<<m1<<m2<<endl;
    sort(a+1,a+m1+1,cmp1);
    sort(b+1,b+m2+1,cmp2);
   // for(int i=1;i<=m1;i++)cout<<a[i].lev<<" "<<a[i].cs<<endl;
   for(int i=m2;i>0;i--)
   {
       while(m1>0&&a[m1].cs)
   }
}
int main()
{
    freopen("code.in","r",stdin);
    scanf("%d",&n);

    while(n!=0)
    {
        doc();
        xuly();
        scanf("%d",&n);
    }
}
