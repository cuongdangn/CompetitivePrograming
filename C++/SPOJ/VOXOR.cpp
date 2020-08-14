#include <bits/stdc++.h>

using namespace std;

#define fou(i,a,b) for(int i=a;i<=b;i++)
#define fod(i,a,b) for(int i=a;i>=b;i--)

int n,q;
long long chuyen;
int chu[33];
int a[100005];
long long lt[33];

struct node{
    int sl,k;
    struct node* c[2];

} *root;
void Init() {
    root=new node();
    root->sl=n;
}
int chebien(int x)
{
    int i=0;
    int t=x;
    int b[33];
    fou(i,0,32)b[i]=0;
    while(x>0)
    {
        int r=x%2;
        b[i]=r;
        x=x/2;
        i++;
    }
    node *cur=root;
    fod(i,31,0){
        //cout<<b[i];
        if(cur->c[b[i]]==NULL){
                cur->c[b[i]]=new node();
                cur=cur->c[b[i]];
                cur->k=b[i];
                cur->sl=1;
        }else{
            cur=cur->c[b[i]];
            cur->sl++;
        }
    }
    //cout<<" "<<x<<endl;
}
int doc()
{
    scanf("%d%d",&n,&q);
    fou(i,1,n)scanf("%d",&a[i]);
    Init();
    fou(i,1,n)chebien(a[i]);
}
long long FIND(node *cur,int x,int c)
{
    long long tg;
    if(cur->sl<x)return 0;
    if((cur->c[0]==NULL&&cur->c[1]==NULL)||c==0)return (cur->k ^ chu[c])*lt[c];
    if(cur->c[0]==NULL)return FIND(cur->c[1],x,c-1)+(cur->k ^ chu[c])*lt[c];
    if(cur->c[1]==NULL)return FIND(cur->c[0],x,c-1)+(cur->k ^ chu[c])*lt[c];
    if(chu[c-1]==1){
        if(x>cur->c[0]->sl) tg=FIND(cur->c[1],x-cur->c[0]->sl,c-1);
        else tg=FIND(cur->c[0],x,c-1);
        return tg+(cur->k ^ chu[c])*lt[c];
    }else{
        if(x>cur->c[1]->sl) tg=FIND(cur->c[0],x-cur->c[1]->sl,c-1);
        else tg=FIND(cur->c[1],x,c-1);
        return tg+(cur->k ^ chu[c])*lt[c];
    }
}
int capnhap(int x)
{
   // cout<<x;
    chuyen=chuyen ^ x;
    long long t=chuyen;
   // cout<<chuyen;
    fou(i,0,31)chu[i]=0;
    int i=0;
    while(chuyen>0)
    {
        //cout<<chuyen;
        chu[i]=chuyen%2;
        chuyen=chuyen/2;
        i++;
    }
    chuyen=t;
   // cout<<chuyen;
    //fod(i,31,0)cout<<chu[i];
   // cout<<endl;
}
int xuly()
{
     char s[5];
        int x;
    while(q--){
        cin>>s>>x;
       //cout<<s<<" "<<x<<endl;
        if(s[0]=='F')
            printf("%I64d\n",FIND(root,x,32));
        else capnhap(x);
    }
}
int main()
{
    //freopen("code.in","r",stdin);
    //freopen("code.ou","w",stdout);
    lt[0]=1;
    fou(i,1,31)lt[i]=lt[i-1]*2;
    doc();
    xuly();

}
