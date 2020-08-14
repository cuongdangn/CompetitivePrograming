#include <algorithm>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <functional>
#include <iostream>
#include <vector>

using namespace std;
const int N = 110;
const int MAX = 2010;

int m;

int v[N], c[N], dp[N][MAX];
vector<int> ed[N];

void dfs(int u, int p) {
  copy(dp[p], dp[p] + m + 1, dp[u]);
  for (int i = 0; i < int(ed[u].size()); ++i) {
    int x = ed[u][i];
    if (x == p) continue;
    dfs(x, u);
  }
  for (int i = 0; i + c[u] <= m; ++i)
    if (dp[u][i] != -1) {
      dp[p][i + c[u]] = max(dp[p][i + c[u]], dp[u][i] + v[u]);
    }
}

int main() {

  int n;
  scanf("%d %d", &n, &m);
  for (int i = 2; i <= n; ++i) {
    scanf("%d", v + i);
  }
  for (int i = 2; i <= n; ++i) {
    scanf("%d", c + i);
  }
  for (int i = 1; i < n; ++i) {
    int u, v;
    scanf("%d %d", &u, &v);
    ed[u].push_back(v);
    ed[v].push_back(u);
  }
  memset(dp, -1, sizeof(dp));
  dp[0][0] = 0;
  dfs(1, 0);
  int ans = *max_element(dp[1], dp[1] + m + 1);
  printf("%d", ans);
}
