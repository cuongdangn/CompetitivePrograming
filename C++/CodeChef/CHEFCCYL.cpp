#include <bits/stdc++.h>

using namespace std;

const int MAXN = 1e5 + 5;

int pathin[MAXN];
int pathout[MAXN];
int disC[MAXN][3];


struct Cycle {

    vector<int> a;
     int vv0, vv1;
    vector<int> sum_a;
    int sizee;
     int inArc() {
        return getD(vv1, vv0);
    }
     int getD(int u, int v) {
        if(u == v) return 0;
        if(u > v) swap(u, v);
        int tmp = sum_a[v-1] - (u == 0 ? 0 : sum_a[u-1]);
        return min(tmp, sum_a[sizee-1] - tmp);
    }
    void init() {
        sum_a.resize(sizee);
        sum_a[0] = a[0];
        for(int i = 1; i < sizee; ++i)
            sum_a[i] = sum_a[i-1] + a[i];
    }


};

Cycle C[MAXN];
int n, q;
int all_sum;

int cycle_d(int c1, int c2, int t) {
    if(c1 > c2) {
        int tg = c1;
        c1 =c2;
        c2 = tg;
    }
    if(t == 0) {
        return pathin[c2-1] - (c1 == 0 ? 0 : pathin[c1-1]) + pathout[c2-1] - pathout[c1];
    } else {
        return all_sum - C[c1].inArc() - C[c2].inArc() - (pathin[c2-1] - (c1 == 0 ? 0 : pathin[c1-1]) + pathout[c2-1] - pathout[c1]);
    }
    return 0;
}
int incycle_d(int c, int u, int v) {
    return C[c].getD(u, v);
}



int main() {
    int test;
    cin >> test;
    while(test--) {
        cin >> n >> q;
        int ai;
        for(int i = 0; i < n; ++i) {
            cin >> ai;
            C[i].a.resize(ai);
            C[i].sizee = ai;
            for(int j = 0; j < ai; ++j)
                cin >> C[i].a[j];
            C[i].init();
        }
        all_sum = 0;
        for(int i = 0; i < n; ++i) {
            int v0, v1;
            cin >> disC[i][0] >> disC[i][1] >> disC[i][2];
            disC[i][0]--;
            disC[i][1]--;
        }
        for(int i = 0; i < n; ++i) {
            if(i == 0) {
                C[i].vv0 = disC[n-1][1];
                C[i].vv1 = disC[i][0];
            } else {
                C[i].vv0 = disC[i-1][1];
                C[i].vv1 = disC[i][0];
            }
            all_sum += C[i].inArc() + disC[i][2];
        }
        pathout[0] = C[0].inArc();
        pathin[0] = disC[0][2];
        for(int i = 1; i < n; ++i) {
            pathin[i] = pathin[i-1] + disC[i][2];
            pathout[i] = pathout[i-1] + C[i].inArc();
        }

        for(int i = 0; i < q; ++i) {
            int v1, c1, v2, c2;
            cin >> v1 >> c1 >> v2 >> c2;
            if(c1 > c2) {
                swap(c1, c2);
                swap(v1, v2);
            }
            v1--;v2--;
            c1--; c2--;


            cout << min(incycle_d(c1, v1, C[c1].vv1)
                        + cycle_d(c1, c2, 0)
                        + incycle_d(c2, v2, C[c2].vv0),
                        incycle_d(c1, v1, C[c1].vv0)
                        + cycle_d(c1, c2, 1)
                        + incycle_d(c2, v2, C[c2].vv1)) << endl;
        }
    }
    return 0;
}
