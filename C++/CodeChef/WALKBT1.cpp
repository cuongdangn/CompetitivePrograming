/*
    char from 'a' to 'z'
*/
#include <bits/stdc++.h>

using namespace std;

const int MAX_NCHAR = 2;
const int LOWEST_CHAR = int('a'); // = int('a')

struct Node {
    Node* next[MAX_NCHAR];
    int count_;
    int end_; //number of string in this node
    Node(){
        count_ = 0;
        end_ =0;
        for(int i=0;i<MAX_NCHAR;i++)
            next[i] = NULL;
    }
    Node(int t){
        count_ = t;
        end_ = 0;
        for(int i=0;i<MAX_NCHAR;i++)
            next[i] = NULL;
    }
    ~Node(){
        for(int i=0;i<MAX_NCHAR;i++)
            if(next[i]!=NULL)
             delete next[i];
    }
};
struct Trie {
    Node* root;
    long long dem;
    Trie(){
        root = new Node(0);
    }
    void add(const string s){
        Node* p = root;
        int n = s.length();
        for(int i=0; i<n; i++){
            int tmp = int(s[i])-LOWEST_CHAR;
            if(p->next[tmp]==NULL){
                p->next[tmp] = new Node();
            }
            p->next[tmp]->count_++;
            p=p->next[tmp];
        }
        p->end_++;
    }
    void add(char s[]){
        Node* p = root;
        int n = strlen(s);
        //cout << n <<"*"<<endl;
        for(int i=0; i<n; i++){
            int tmp = int(s[i])-LOWEST_CHAR;
            if(p->next[tmp]==NULL){
                p->next[tmp] = new Node();
                dem++;
            }
            p->next[tmp]->count_++;
            p=p->next[tmp];
        }
        p->end_ ++;
    }
    void clearr(Node *p)
    {
        if(p==NULL) return;
    //    cout << 1;
         for(int i=0;i<MAX_NCHAR;i++)
            clearr(p->next[i]);
         for(int i=0;i<MAX_NCHAR;i++)
            if(p->next[i]!=NULL)
            delete p->next[i];
        dem = 1;
    }
    bool deletenode_(Node* p,const string s,int i,const int n){

         if(i==n){

                if(p->end_ >0){
                        p->end_ --;
                        return true;
                }
                 else {
                        return false;
                 }

         }
            int tmp = int(s[i])-LOWEST_CHAR;
         if(p->next[tmp]==NULL) return false;
         bool ok = deletenode_(p->next[tmp],s,i+1,n);

         if(ok){
            if(p->count_ == 1) {
                    delete p->next[tmp];
                    p->next[tmp] = NULL;
            }
              else{
                    p->next[tmp]-> count_ --;
                  //  p->next[tmp]-> end_ --;
              }
         }
         return ok;
    }
    void delete_(const string s){
        int n = s.length();
        Node* p = root;
       // if(!deletenode_(root,s,0,n))
         //   cout << "s not belong trie" <<endl;
    }

    bool check(const string s){
        int n = s.length();
        Node* p = root;
        for(int i=0;i<n;i++){
            int tmp = int(s[i])-LOWEST_CHAR;
            if(p->next[tmp]==NULL) return false;
            p=p->next[tmp];
        }
        return p->end_ > 0;
    }
    void DFS(Node* p){
        if(p==NULL) return;
        cout << p->count_  << " "<<p->end_ <<endl;
        for(int i=0;i<MAX_NCHAR;i++)
            DFS(p->next[i]);
    }
};


string s;
int n,m;
char c;
long long dem;
int main()
{
     freopen("code.in","r",stdin);
    //freopen("code.out","w",stdout);
    int test;
    //scanf("%s",s);
   // cout<< int(s[strlen(s)]);
    scanf("%d",&test);
    while(test--){
        dem = 1;
        map<string, int> mm;
        s.clear();
        scanf("%d%d\n",&n,&m);
        for(int i=0;i<n;i++)
            s.push_back('a');
            cout << s <<endl;
    //    s[n+1] = 'A';
     //   cout << s;
        for(int i=1;i<=m;i++){
            scanf("%c",&c);
            if(c=='!'){
                int x;
                scanf("%d\n",&x);
             //   cout << c <<" "<<x<<endl;
                int j = n-1-x;
                while(j>=0 && s[j] == 'b'){
                    s[j] = 'a';
                    j--;
                }
                if(j>=0)
                    s[j] = 'b';
                else
                    j= 0;
                    cout << s <<endl;

                if(mm[s] == 0){
                    if(i==1)
                        dem = dem+n;
                    else
                        dem = dem+n-j;
                    mm[s] = 1;
                }
            }
            else
            {
                scanf("\n");
                printf("%lld\n",dem);
            }
        }
    }

}
