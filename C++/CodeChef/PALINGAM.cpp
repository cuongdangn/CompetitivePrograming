#include <bits/stdc++.h>

using namespace std;

int a[30];
int b[30];
int n;
char s[600];
void input()
{
    for(int i=0;i<30;i++){
        a[i]=0;
        b[i]=0;
    }
    scanf("%s",s);
  //  cout << s<<endl;
    n = strlen(s);
    // cout << n<<endl;
   //  cout << n<<endl;
    for(int i=0;i<n;i++){
      //  cout << int(s[i])-int('a')<<endl;
        a[int(s[i])-int('a')]++;
    }
    scanf("%s",s);
  //  cout<<s<<endl;
    for(int i=0;i<n;i++)
        b[int(s[i])-int('a')]++;

}
void solve()
{
    if(n==1){
        printf("B\n");
        return;
    }
     for(int i=0;i<26;i++)
    if(a[i]>=2 && b[i]==0){
        printf("A\n");
        return;
    }
    for(int i=0;i<26;i++)
    if(a[i]>0 && b[i]==0){
        if(a[i]>=2){
            printf("A\n");
            return;
        }
        for(int j=0;j<26;j++)
        if(b[j]>0 && a[j]==0){
            printf("B\n");
            return;
        }
        printf("A\n");
        return;
    }
    printf("B\n");
}
int main()
{
    //freopen("code.in","r",stdin);
    int test;
    scanf("%d",&test);
    while(test--){
        input();
        solve();
    }
}


