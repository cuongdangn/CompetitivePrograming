#include<iostream>
#include<cstdio>
#include<algorithm>
#include<string>

using namespace std;

int main()
{
    int n;
   // freopen("code.in","r",stdin);
    long long d,x,s,c,pl,ps,kq;
    scanf("%d",&n);
    for(int i=1;i<=n;i++)
    {
        cin>>d>>x>>s;
        cin>>c>>pl>>ps;

        long long minc,mins;
        long long kq,sld;
        long long thua;

        minc=pl;
        mins=ps;
        kq=0;
        thua=0;

        kq=kq+c*x*pl;
        sld=c*s/80;
        if(sld*80<c*s)sld++;
        kq=kq+sld*ps;
        thua=thua+sld*80-c*s;
        //cout<<thua<<endl;
        for(int i=2;i<=d;i++)
        {
             cin>>c>>pl>>ps;
            if(minc>pl)minc=pl;
            if(mins>ps)mins=ps;
            kq=kq+c*x*minc;
            if(thua>=c*s)
            {
                thua=thua-c*s;
            }else
            {
                sld=(c*s-thua)/80;
                if(sld*80<c*s-thua)sld++;
                kq=kq+sld*mins;
                thua=thua+sld*80-c*s;
            }

        }
        printf("%lld \n",kq);
    }


}
