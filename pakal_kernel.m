function [k_a,k_b,k_c]=pakal_kernel(n)
  % obtiene los kernels para pakal
  k=(n-1)/2
  k_v=[-k:k]
  p=n*dot(k_v,k_v)
  p_v=repmat(1/p,1,n)
  k_c=k_v'.*repmat(p_v',1,n)
  k_b=k_v.*repmat(p_v',1,n)
  k_a=repmat(1/(n*n),n,n)

