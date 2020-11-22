texture<unsigned int, 2, cudaReadModeElementType> tex_image;

__device__ float g_func(float x, float y, float sigma)
{
	return exp(-(pow(x, 2) + pow(y, 2)) / pow(sigma, 2));
}

__device__ float r_func(float f_i, float f_0, float sigma)
{
	return exp((pow(f_i, 2) - pow(f_0, 2)) / pow(sigma, 2));
}

__global__ void bilateral_filtering_gpu(unsigned char* result, int M, int N, float sigma_d, float sigma_r)
{   
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = threadIdx.y + blockDim.y * blockIdx.y;
    if ((i < M) && (j < N)) {
            float h = 0;
            float k = 0;
            unsigned char f_0 = tex2D(tex_image, i, j);
            for (int j_k = i - 1; j_k <= i + 1; j_k++){
                for (int i_k = j - 1; i_k <= j + 1; i_k++){
                    unsigned char f_i = tex2D(tex_image, i_k, j_k);
                    float g = g_func((i_k - i), (j_k - j), sigma_d);
                    float r = r_func(f_i, f_0, sigma_r);
                    k += g * r;
                    h += g * r * tex2D(tex_image, i_k, j_k);
                }
            }
            result[i * N + j] = h / k;
        }
}