**kernel.cu** - функции CUDA.<br/>
**CUDA_bilateral.ipynb** - ipynb файл Google Colab, где производились расчеты, а также реализация последовательного алгоритма.<br/>

### Время работы и ускорение параллельного алгоритма
|  | CPU |  GPU |
|:----:|:----:|:----:|
|**Время работы, с.**| 12,366 | 0,012 |
<br/>

**Ускорение параллельного алгоритма: 985.629**

### Входное изображение
![alt text](https://github.com/IlyaOv/cuda_bilateral/blob/main/image_input.bmp)
### Выходное изображение (CPU)
![alt text](https://github.com/IlyaOv/cuda_bilateral/blob/main/result_image_cpu.bmp)
### Выходное изображение (GPU)
![alt text](https://github.com/IlyaOv/cuda_bilateral/blob/main/result_image_gpu.bmp)
