#include<iostream>
#include<cstdio>
#include<algorithm>
#include<string>
#include<vector>

using namespace std;

struct bg
{
    vector<int> tcon;
    int l;
    int gt;
    string dau;
};
bg ds[100];
string dsl[100];
int n,dem;

bool ktso(char s)
{
    int x=int(s);
    x=x-48;
    if(x>=0&&x<=9)return true;
    return false;
}
int doc()
{
    for(int i=1;i<=n;i++)
        cin>>dsl[i];
}
int xaydung(int cha,int lev)
{
    dem++;
    int tgle=dsl[dem].length();
    while(tgle==lev&&dem<=n)
    {
        if(ktso(dsl[dem][tgle-1]))
        {
            ds[cha].tcon.push_back(dem);
            ds[dem].l=1;
            ds[dem].gt=int(dsl[dem][tgle-1])-48;
        }
        else
        {
            ds[cha].tcon.push_back(dem);
            ds[dem].l=2;
            ds[dem].dau=dsl[dem][tgle-1];
            xaydung(dem,lev+1);
        }
        dem++;
        tgle=dsl[dem].length();
    }
    dem--;
}
int tinh(int x,string dd,int y)
{
    if(dd=="+")return x+y;
    return x*y;
}
int xuly(int x)
{
    int tg;
    if(ds[x].l==1)return ds[x].gt;
    if(ds[x].dau=="+")tg=0;else tg=1;
    for(int i=0;i<ds[x].tcon.size();i++)
        tg=tinh(tg,ds[x].dau,xuly(ds[x].tcon[i]));
    return tg;
}
int main()
{
    //freopen("code.in","r",stdin);
    scanf("%d",&n);
    int kq;
    while(n!=0)
    {
        doc();
        dem=0;
        xaydung(0,1);
        kq=xuly(1);
        printf("%d\n",kq);
        for(int i=1;i<=n;i++)ds[i].tcon.resize(0);
        scanf("%d",&n);
    }
}
