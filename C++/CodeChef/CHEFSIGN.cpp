#include <bits/stdc++.h>

using namespace std;

char s[100005];
int main()
{
    int TestCase;
   // freopen("codec.in","r",stdin);
    //freopen("codec.out","w",stdout);
    scanf("%d",&TestCase);
    while(TestCase--){
        scanf("%s",s);
        //cout << s << endl;
        int t = 1;
        int ma = 0;
        int n = strlen(s);
        int dem = 0;
        int j = 0;
        while(j<n && s[j] == '=')
            j++;
        char tr;
        if(j<n){
            ma = 1;
            tr = s[j];
        }
        for(int i=j;i<n;i++){
            if(s[i] == '=') continue;
            if(s[i] == tr)
                dem++;
            else {
                tr = s[i];
                dem = 1;
            }
            ma = max(ma,dem);
        }
        printf("%d\n",ma+1);
    }
}

