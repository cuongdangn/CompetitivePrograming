#include<iostream>
#include<cmath>
#include<algorithm>
#include<cstdio>

using namespace std;

int cha[10008];
int n;

int findc(int u)
{
    if(cha[u]<0)return u;
    cha[u]=findc(cha[u]);
    return cha[u];
}
void hop(int u,int v)
{
    int cha1,cha2;
    cha1=findc(u);
    cha2=findc(v);
    if(cha1!=cha2)
    {
        if (cha[cha1]>cha[cha2])
        {
            cha[cha2]+=cha[cha1];
            cha[cha1]=cha2;
        }
        else
        {
            cha[cha1]+=cha[cha2];
            cha[cha2]=cha1;
        }
    }
}
int main()
{
    int u,v,t;
    //freopen("code.inp","r",stdin);

    cin>>n;
    for(int i=1;i<=10000;i++)cha[i]=-1;
    for(int i=1;i<=n;i++)
    {
        cin>>u>>v>>t;
        if(t==1)hop(u,v);
        else
        {
            if(findc(u)==findc(v))cout<<1<<endl;
            else cout<<0<<endl;
        }
    }
   // return 0;
}
