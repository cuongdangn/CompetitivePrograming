#include <bits/stdc++.h>

using namespace std;

char s[200];
map<char,int> mm;
int main()
{
    int test;
    scanf("%d",&test);
    while(test--){
        scanf("%s",s);
        int n = strlen(s);
        mm.clear();
        for(int i=0;i<=n;i++){
         if(i==n){
            printf("no\n");
            break;
         }
        if(mm[s[i]]==0){
            mm[s[i]]=1;
        }
        else {
            printf("yes\n");
            break;
        }
        }
    }
}
