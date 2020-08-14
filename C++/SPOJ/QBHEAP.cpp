#include<bits/stdc++.h>

using namespace std;

const int MAX_SIZE = 100000;

struct Node{
    int key;
    bool priority(Node p){
        return (key>=p.key);
    }
};

struct Heap{

    int size_heap;
    Node heaplist[MAX_SIZE];

    Heap(){
        size_heap = 0;
    }

    void pop(){
        heaplist[1]= heaplist[size_heap];
        size_heap--;
        downheap(1);
    }
    void add(int key){
        size_heap++;
        heaplist[size_heap].key = key;
        upheap(size_heap);
    }
    void upheap(int c){
        do{
            int p = c/2;
            if(p==0 || heaplist[p].priority(heaplist[c])) break;
            Node tmp = heaplist[c];
            heaplist[c] = heaplist[p];
            heaplist[p] = tmp;
            c=p;
        }while(1);
    }
    void downheap(int p){
        do{
            int c = p*2;
            if(c<size_heap && heaplist[c+1].priority(heaplist[c]))c=c+1;
            if(c>size_heap || heaplist[p].priority(heaplist[c])) break;
            Node tmp = heaplist[c];
            heaplist[c] = heaplist[p];
            heaplist[p] = tmp;
            p = c;
        }while(1);
    }
    Node gettop(){
        return heaplist[1];
    }
};

Heap qu;
map<int,int> mm;
int n;
int main()
{
  //  freopen("code.in","r",stdin);
    char c;
    n=0;
    //scanf("%c",&c);
    int i=0;

    while(scanf("%c",&c)!=EOF)
    {
        i+=1;
        //if(i==18)break;
       // cout<<c;
        if(c=='+'){
                int x;
            scanf("%d\n",&x);

           // cout<<x<<"\n";
            if(n<15000){
            mm[x]++;
            n++;
            if(mm[x]==1)qu.add(x);
            }
        }
        else{
                scanf("\n");
        if(qu.size_heap!=0){
           // cout<<"\n";
            int x=qu.gettop().key;
            n=n-mm[x];
            mm[x]=0;
            qu.pop();
        }
        }
        //cin>>c;
        //scanf("%c",&c);
        //cout<<c<<endl;
    }

    printf("%d\n",qu.size_heap);
    while(qu.size_heap)
    {
        int x=qu.gettop().key;
        printf("%d\n",x);
        qu.pop();
    }

}
