#include <bits/stdc++.h>

using namespace std;

#define ii pair<int, int>

const int N = 100005;

ii quly[500];
int id[N];
int n,q,m,m1;
int Left[N];
int dp[N],dpp[N],minn[N];
pair<long long, int> b[N];
long long a[N];
long long up[500];
//ii tmp[500],tmp1[500],tmp2[500];

void input()
{
    scanf("%d%d",&n,&q);
    for(int i=1;i<=n;i++){
        scanf("%lld",&a[i]);
        b[i].first = a[i];
        b[i].second = i;
    }

}
void init1(int x,int y)
{
    Left[y] = y;
    dp[y]=1;
    dpp[y] =y;
    for(int i=y-1;i>=x;i--){
        int j = i+1;
        while(dpp[j]!=j && Left[j]-i<=100 && a[i]>=a[j])
            j = Left[j];

        if(a[i]<a[j]){
            Left[i] = j;
            dp[i]=dp[j]+1; // - v
            dpp[i] = dpp[j];
        }
        else{
            Left[i] = i;
            dp[i] = 1;
            dpp[i] = i;
        }
         // phan tu cuoi cua doan
    }
    //////////////////
}
void init2(int x,int y)
{
    minn[y] = b[y].second;
    for(int i=y-1;i>=x;i--){
        minn[i] = min(minn[i+1],b[i].second);
    }
}
void init()
{
    m = trunc(sqrt(n));
    m1 = 0;
    for(int i=1;i<=n;i++)
    if(id[i]==0){
        m1++;
        int n1 = min(n,i+m-1);
        quly[m1].first = i;
        quly[m1].second= n1;
        for(int j=i;j<=n1;j++)
            id[j] = m1;
    }
    ///////////////////////
    for(int i=1;i<=m1;i++)
        sort(b+quly[i].first,b+quly[i].second+1);
    //////////////////////
    for(int i=1;i<=m1;i++){
        init1(quly[i].first,quly[i].second);
        init2(quly[i].first,quly[i].second);
    }


}

int tim(int i,long long x)
{
    int dau = quly[i].first;
    int cuoi = quly[i].second;
    int luu = 0;
    int giua;
    //cout << x<<" "<<dau<<" "<<cuoi<<" chat"<<endl;
    while(dau<=cuoi){
        giua = (dau+cuoi)/2;
        if(b[giua].first+up[i]<=x){
            dau = giua+1;
           // cout << 1<<" chat"<<endl;
        }
        else{
            luu = giua;
            cuoi = giua-1;
        }
    }

    return minn[luu];
}

int xuly1(int u,int v)
{
    int curr = u;

    while(true){
      //  cout << curr<<" "<<dp[curr]<<" "<<v <<endl;
       if(v==0){
                    printf("%d\n",curr);
                    return 0;
                }
      //  if (curr==5) return 0;
        if(v<dp[curr]){
             for(int i=curr;i<=quly[id[curr]].second;i++)
                if(i-curr<=100){
                    if(a[curr]+up[id[curr]]<a[i]+up[id[i]]){
                        v--;
                        if(v==0){
                            printf("%d\n",i);
                            return 0;
                        }
                        curr = i;
                    }
            }
            else break;
            printf("%d\n",curr);
            return 0;
        }
        else {
            v=v-dp[curr]+1;
            curr = dpp[curr];
            if(id[curr]==m1){
                printf("%d\n",curr);
                return 0;
            }
            else
            {
                int next = curr;
                int idd = id[curr]+1;
                while(idd<=m1){
                    //cout << idd <<"*"<<curr<<endl;
                    next = tim(idd,a[curr]+up[id[curr]]);
                    //cout << next <<endl;
                    if(next!=0) break;

                    idd++;
                }
                if(next==0 || next-curr>100){
                    printf("%d\n",curr);
                    return 0;
                }
                curr = next;
                v--;
            }
        }
    }
    printf("%d\n",curr);
}

void init3(int x,int y)
{
  //  int mm1 = 0;
  //  int mm2 = 0;
    for(int i=x;i<=y;i++){
        int j = b[i].second;
        if(a[j]!=b[i].first){
      //      mm1++;
            b[i].first = a[j];
        //    tmp1[mm1] = b[i];
        }
      //  else{
        //    mm2++;
        //    tmp2[mm2] = b[i];
      //  }
    }
    /*
    int cu = 1;
    for(int i=1;i<=mm1;i++){
        if(tmp1[i].first<)
    }


    for(int i=x;i<=y;i++)
        b[i] = tmp[i-x+1];
        */
    sort(b+x,b+y+1);
    init2(x,y);
}
void update(int i,int j,long long x)
{
    if(id[i]==id[j]){
        for(int k=i;k<=j;k++)
            a[k]+=x;
         init1(quly[id[i]].first,quly[id[i]].second);
         init3(quly[id[i]].first,quly[id[i]].second);
         //cout << 1;
    }
    else
    {
        if(quly[id[i]].first==i){
            up[id[i]]+=x;
        }
        else{
            for(int k = i;k<=quly[id[i]].second;k++)
                a[k]+=x;
            init1(quly[id[i]].first,quly[id[i]].second);
            init3(quly[id[i]].first,quly[id[i]].second);
        }
        for(int k=id[i]+1;k<id[j];k++)
            up[k]+=x;
        if(j==quly[id[j]].second)
            up[id[j]]+=x;
        else
        {
            for(int k=quly[id[j]].first;k<=j;k++)
                a[k]+=x;
            init1(quly[id[j]].first,quly[id[j]].second);
            init3(quly[id[j]].first,quly[id[j]].second);
        }
    }
}
void solve()
{
    init();
   // for(int i=1;i<=m1;i++)
      //  cout << quly[i].first<<" "<<quly[i].second<<endl;
    int l,u,v;
    long long x;
    for(int k=1;k<=q;k++){
        //cout <<k<<endl;
        scanf("%d",&l);
        if(l==1){
            scanf("%d%d",&u,&v);
            xuly1(u,v);
        }
        else {
            scanf("%d%d%lld",&u,&v,&x);
            //continue;
            update(u,v,x);
          //  cout <<endl;
          ///  for(int i=1;i<=n;i++){
          //      cout <<a[i]<<" "<<b[i].first<<" "<<b[i].second<<" "<<up[id[i]]<<endl;
          //  }

           // cout <<endl;
        }
    }
}
int main()
{
    //freopen("code.in","r",stdin);
    //freopen("code.ou","w",stdout);
    input();
    solve();
}
