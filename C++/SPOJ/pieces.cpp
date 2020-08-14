#include <bits/stdc++.h>

using namespace std;
const int MAX_SIZE = 100000;

struct Node{
    int key;
    bool priority(Node p){
        return (p.key>=key);
    }
     Node(int key_){
        key = key_;
    }
    Node(){
        key = 0;
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
    void add(Node node){
        size_heap++;
        heaplist[size_heap] = node;
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


int n,m;
int a[305];
long long sum;
Heap heap;
void input()

{
    sum = 0;
    heap.size_heap = 0;
    scanf("%d%d",&n,&m);
    for(int i=1;i<=n;i++){
        for(int j=1;j<=m;j++)
            scanf("%d",&a[j]);
        sort(a+1,a+m+1);
        for(int j=1;j<=m;j++){
           heap.add(a[j]+j*j-(j-1)*(j-1));
        }
        sum += heap.gettop().key;
        heap.pop();
    }
}
void solve(int t)
{
    printf("Case #%d: %lld\n",t,sum);
}
int main()
{
    freopen("pie_progress.txt","r",stdin);
    freopen("ans.txt","w",stdout);
    int t;
    scanf("%d",&t);
    for(int i=1;i<=t;i++){
        input();
        solve(i);
    }
}
