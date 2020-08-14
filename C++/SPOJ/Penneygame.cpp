#include<cstdio>
#include<string>
#include<iostream>


using namespace std;

int n,j,jj,luu[9];
string a;

bool bang(string a,string b)
{
 //  cout<<a<<" "<<b<<endl;
    if (a.compare(b)!=0) return false;else
    return true;
}

void tang(string x)
{
    //cout<<x<<endl;
   // cout<<x=="HHH"<<endl;
    if(bang(x,"TTT"))luu[1]++;
    if(bang(x,"TTH"))luu[2]++;
    if(bang(x,"THT"))luu[3]++;
    if(bang(x,"THH"))luu[4]++;
    if(bang(x,"HTT"))luu[5]++;
    if(bang(x,"HTH"))luu[6]++;
    if(bang(x,"HHT"))luu[7]++;
    if(bang(x,"HHH"))luu[8]++;
}
int main()
{
    //freopen("code.in","r",stdin);
    scanf("%d",&n);
    for(int i=1;i<=n;i++)
    {
       cin>>j;
       cin>>a;
       //cout<<a[0];
       string tg;
       tg="";
       for(int jj=1;jj<=8;jj++)luu[jj]=0;
       tg=a[0];
       tg=tg+a[1];
       for(int jj=2;jj<40;jj++)
       {
           tg=tg+a[jj];
          // cout<<tg<<endl;
           tang(tg);
           tg=a[jj-1];
           tg=tg+a[jj];
       }
       printf("%d ",j);
       for(int jj=1;jj<=8;jj++)
        printf("%d ",luu[jj]);
       cout<<endl;
    }
}
