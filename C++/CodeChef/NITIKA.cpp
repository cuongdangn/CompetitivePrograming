#include <bits/stdc++.h>

using namespace std;

char s[60];
int main()
{
    int TestCase;
    //freopen("codec.in","r",stdin);
    scanf("%d\n",&TestCase);
    while(TestCase--){
        cin.getline(s,50);
        int dem = 0;
        int n = strlen(s);
        for(int i=0;i<n;i++){
            if(i==0 || s[i-1] == ' '){
                if(int(s[i])>=97)
                    s[i] = s[i] - 32;
                    dem++;
            }
            else
                if(s[i]!=' ')
                    if(int(s[i])<97)
                        s[i] = s[i]+32;


        }
        //cout << s << endl;
        int j = 0;
        while(dem>0){
            dem--;
            if(dem==0)
                for(int i=j;i<n;i++)
                    printf("%c",s[i]);
            else
            {
                printf("%c. ",s[j]);
                while(j<n && s[j]!=' ')
                    j++;
                j++;
            }
        }
        printf("\n");

    }
}
