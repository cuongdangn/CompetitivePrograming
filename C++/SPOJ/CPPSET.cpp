#include<iostream>
#include<cmath>
#include<cstdio>
#include<set>

using namespace std;

set<int> mset;
int l,x;
int main()
{
    //freopen("code.in","r",stdin);
    scanf("%d",&l);
    while(l!=0)
    {
        if(l<=2)
        {
            scanf("%d",&x);
            if(l==1)mset.insert(x);
                else mset.erase(x);
        }
        else
        {
            int s=mset.size();
            if(s==0)printf("empty\n");

            else
                if(l<=4)
                {
                    if(l==3)printf("%d\n",*mset.begin());
                    else printf("%d\n",*mset.rbegin());
                }
                else
                {
                    set<int>::iterator tg;
                    scanf("%d",&x);
                    if(l<=6)
                    {
                        if(l==5)tg=mset.upper_bound(x);
                        else tg=mset.lower_bound(x);
                        if(tg==mset.end())printf("no\n");
                        else printf("%d\n",*tg);
                    }
                    else
                    {
                        if(l==7)tg=mset.lower_bound(x);
                        else tg=mset.upper_bound(x);
                        if(tg==mset.begin())printf("no\n");
                        else printf("%d\n",*--tg);
                    }
                }
        }
        scanf("%d",&l);
    }
}
