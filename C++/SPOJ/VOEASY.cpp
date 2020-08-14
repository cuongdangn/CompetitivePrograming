#include <iostream>
#include <cstdio>
#include <map>
#include <vector>
#include <string>
#include <cstring>

using namespace std;

struct truy
{
    int x,y;
    string lenh;
};
map<vector<int> ,int> mymap;
int a[20015][11];
truy ll[101][11];
 vector<int> tg;
 int da,cu;

int n,m,k;
int doc()
{

    scanf("%d %d %d",&n,&m,&k);
    for(int i=1;i<=n;i++)
    {
        scanf("%d",&a[1][i]);
        tg.push_back(a[1][i]);
    }
    tg.push_back(m);
    mymap[tg]=1;
    for(int i=1;i<=m;i++)
    {
        for (int j=1;j<=n;j++)
        {
            cin>>ll[i][j].x>>ll[i][j].lenh>>ll[i][j].y;
            //cout<<ll[i][j].lenh<<endl;
        }
    }
}
int biendoi(int x,int y)
{
    int b[11],c[11];
    for(int i=1;i<=n;i++)c[i]=a[y-1][i];

        for (int j=1;j<=n;j++)
        {
            if (ll[x][j].lenh=="and")b[j]=c[ll[x][j].x] & c[ll[x][j].y];
                else if (ll[x][j].lenh=="or")b[j]=c[ll[x][j].x] | c[ll[x][j].y];
                 else b[j]=c[ll[x][j].x] ^ c[ll[x][j].y];
            //cout<<ll[i][j].lenh<<endl;
        }

    for(int i=1;i<=n;i++)a[y][i]=b[i];

}
int xuly()
{
    for(int i=2;i<=k+1;i++)
    {
        int t=(i-1)%m;
        if (t==0) t=m;
        biendoi(t,i);
        tg.clear();
        for(int j=1;j<=n;j++)
            tg.push_back(a[i][j]);
            tg.push_back(t);
        int vt=mymap[tg];
        if (vt==0) mymap[tg]=i;
        else
        {
            da=vt;
            cu=i-1;
            break;
        }
    }
    if(da==0)
        for(int i=1;i<=n;i++)
            printf("%d ",a[k+1][i]);
    else
    {
        int x=da-1;
        int dodai=cu-da+1;
        int du=(k+1-x)%dodai;
        if(du==0)du=cu;else du=du+x;
        for(int i=1;i<=n;i++)
            printf("%d ",a[du][i]);
    }
}
int main()
{
   // freopen("code.in","r",stdin);
    doc();
    xuly();
    return 0;
}
