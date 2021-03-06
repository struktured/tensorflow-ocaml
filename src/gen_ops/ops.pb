
ś
Abort"U
	error_msgstring "<A string which is the message associated with the exception.*3Raise a exception to abort the process when called.2!Returns nothing but an exception.
Š
Abs
x"T
y"T"
Ttype:
2	*(Computes the absolute value of a tensor.2ŇGiven a tensor `x`, this operation returns a tensor containing the absolute
value of each element in `x`. For example, if x is an input element and y is
an output element, this operation computes \\(y = |x|\\).

Add
x"T
y"T
z"T"
Ttype:
2		*Returns x + y element-wise.21*NOTE*: Add supports broadcasting. AddN does not.

AddN4
inputs$Must all be the same size and shape."T*N
sum"T"
Nint(0"
Ttype:
2	*#Add all input tensors element wise.
Ś
AdjustContrast
images"T
contrast_factor
	min_value
	max_value

output"
Ttype:
	2	*0Deprecated. Disallowed in GraphDef version >= 2.
ł
AdjustContrastv2,
images Images to adjust.  At least 3-D.?
contrast_factor*A float multiplier for adjusting contrast.2
output&The contrast-adjusted image or images.**Adjust the contrast of one or more images.2Ď`images` is a tensor of at least 3 dimensions.  The last 3 dimensions are
interpreted as `[height, width, channels]`.  The other dimensions only
represent a collection of images, such as `[batch, height, width, channels].`

Contrast is adjusted independently for each channel of each image.

For each channel, the Op first computes the mean of the image pixels in the
channel and then adjusts each component of each pixel to
`(x - mean) * contrast_factor + mean`.

All 
inputThe tensor to reduce.
0
reduction_indicesThe dimensions to reduce.
outputThe reduced tensor.
"H
	keep_dimsbool( "1If true, retain reduced dimensions with length 1.*EComputes the "logical and" of elements across dimensions of a tensor.2÷Reduces `input` along the dimensions given in `reduction_indices`. Unless
`keep_dims` is true, the rank of the tensor is reduced by 1 for each entry in
`reduction_indices`. If `keep_dims` is true, the reduced dimensions are
retained with length 1.
í
AllCandidateSampler
true_classesA batch_size * num_true matrix, in which each row contains the
IDs of the num_true target_classes in the corresponding original label.	o
sampled_candidatesWA vector of length num_sampled, in which each element is
the ID of a sampled candidate.	Ě
true_expected_count˛A batch_size * num_true matrix, representing
the number of times each candidate is expected to occur in a batch
of sampled candidates. If unique=true, then this is a probability.ę
sampled_expected_countÍA vector of length num_sampled, for each sampled
candidate representing the number of times the candidate is expected
to occur in a batch of sampled candidates.  If unique=true, then this is a
probability."7
num_trueint""Number of true labels per context.(0"B
num_sampledint"*Number of candidates to produce per batch.(0"Ë
uniquebool"şIf unique is true, we sample with rejection, so that all sampled
candidates in a batch are unique. This requires some approximation to
estimate the post-rejection sampling probabilities."Ľ
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision.*LGenerates labels for candidate sampling with a learned unigram distribution.2See explanations of candidate sampling and the data formats at
go/candidate-sampling.

For each batch, this op picks a single set of sampled candidate labels.

The advantages of sampling candidates per-batch are simplicity and the
possibility of efficient dense matrix multiplication. The disadvantage is that
the sampled candidates must be chosen independently of the context and of the
true labels.

Any 
inputThe tensor to reduce.
0
reduction_indicesThe dimensions to reduce.
outputThe reduced tensor.
"H
	keep_dimsbool( "1If true, retain reduced dimensions with length 1.*DComputes the "logical or" of elements across dimensions of a tensor.2÷Reduces `input` along the dimensions given in `reduction_indices`. Unless
`keep_dims` is true, the rank of the tensor is reduced by 1 for each entry in
`reduction_indices`. If `keep_dims` is true, the reduced dimensions are
retained with length 1.
Á
ApplyAdadelta)
varShould be from a Variable()."T+
accumShould be from a Variable()."T2
accum_updateShould be from a Variable()."T*
lr!Scaling factor. Must be a scalar."T)
rhoDecay factor. Must be a scalar."T0
epsilon"Constant factor. Must be a scalar."T
gradThe gradient."T
outSame as "var"."T"
Ttype:
2	"š
use_lockingbool( "If True, updating of the var, accum and update_accum tensors will be protected by
a lock; otherwise the behavior is undefined, but may exhibit less contention.*/Update '*var' according to the adadelta scheme.2×accum = rho() * accum + (1 - rho()) * grad.square();
update = (update_accum + epsilon).sqrt() * (accum + epsilon()).rsqrt() * grad;
update_accum = rho() * update_accum + (1 - rho()) * update.square();
var -= update;

ApplyAdagrad)
varShould be from a Variable()."T+
accumShould be from a Variable()."T*
lr!Scaling factor. Must be a scalar."T
gradThe gradient."T
outSame as "var"."T"
Ttype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*.Update '*var' according to the adagrad scheme.29accum += grad * grad
var -= lr * grad * (1 / sqrt(accum))

	ApplyAdam)
varShould be from a Variable()."T'
mShould be from a Variable()."T'
vShould be from a Variable()."T#
beta1_powerMust be a scalar."T#
beta2_powerMust be a scalar."T*
lr!Scaling factor. Must be a scalar."T.
beta1"Momentum factor. Must be a scalar."T.
beta2"Momentum factor. Must be a scalar."T+
epsilonRidge term. Must be a scalar."T
gradThe gradient."T
outSame as "var"."T"
Ttype:
2	"­
use_lockingbool( "If `True`, updating of the var, m, and v tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*.Update '*var' according to the Adam algorithm.2Ďlr_t <- learning_rate * sqrt(1 - beta2^t) / (1 - beta1^t)
m_t <- beta1 * m_{t-1} + (1 - beta1) * g_t
v_t <- beta2 * v_{t-1} + (1 - beta2) * g_t * g_t
variable <- variable - lr_t * m_t / (sqrt(v_t) + epsilon)
˙
	ApplyFtrl)
varShould be from a Variable()."T+
accumShould be from a Variable()."T,
linearShould be from a Variable()."T
gradThe gradient."T*
lr!Scaling factor. Must be a scalar."T*
l1!Scaling factor. Must be a scalar."T*
l2!Scaling factor. Must be a scalar."T0
lr_power!Scaling factor. Must be a scalar."T
outSame as "var"."T"
Ttype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*4Update '*var' according to the Ftrl-proximal scheme.2ůaccum_new = accum + grad * grad
linear += grad + (accum_new^(-lr_power) - accum^(-lr_power)) / lr * var
quadratic = 1.0 / (accum_new^(lr_power) * lr) + 2 * l2
var = (sign(linear) * l1 - linear) / quadratic if |linear| > l1 else 0.0
accum = accum_new

ApplyGradientDescent)
varShould be from a Variable()."T-
alpha!Scaling factor. Must be a scalar."T
deltaThe change."T
outSame as "var"."T"
Ttype:
2	"
use_lockingbool( "}If `True`, the subtraction will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*7Update '*var' by subtracting 'alpha' * 'delta' from it.
Š
ApplyMomentum)
varShould be from a Variable()."T+
accumShould be from a Variable()."T*
lr!Scaling factor. Must be a scalar."T
gradThe gradient."T*
momentumMomentum. Must be a scalar."T
outSame as "var"."T"
Ttype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*/Update '*var' according to the momentum scheme.21accum = accum * momentum + grad
var -= lr * accum
Ó
ApplyRMSProp)
varShould be from a Variable()."T(
msShould be from a Variable()."T)
momShould be from a Variable()."T*
lr!Scaling factor. Must be a scalar."T'
rhoDecay rate. Must be a scalar."T
momentum"T+
epsilonRidge term. Must be a scalar."T
gradThe gradient."T
outSame as "var"."T"
Ttype:
2	"­
use_lockingbool( "If `True`, updating of the var, m, and v tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*1Update '*var' according to the RMSProp algorithm.2řmean_square = decay * mean_square + (1-decay) * gradient ** 2
Delta = learning_rate * gradient / sqrt(mean_square + epsilon)

ms <- rho * ms_{t-1} + (1-rho) * grad * grad
mom <- momentum * mom_{t-1} + lr * grad / sqrt(ms + epsilon)
var <- var - mom
 
ArgMax

input"T
	dimensionint32, 0 <= dimension < rank(input).  Describes which dimension
of the input Tensor to reduce across. For vectors, use dimension = 0.

output	"
Ttype:
2	*GReturns the index with the largest value across dimensions of a tensor.
Ą
ArgMin

input"T
	dimensionint32, 0 <= dimension < rank(input).  Describes which dimension
of the input Tensor to reduce across. For vectors, use dimension = 0.

output	"
Ttype:
2	*HReturns the index with the smallest value across dimensions of a tensor.
ű
Assert)
	conditionThe condition to evaluate.
<
data1The tensors to print out when condition is false.2T"
T
list(type)(0"=
	summarizeint"'Print this many entries of each tensor.*)Asserts that the given condition is true.2If `condition` evaluates to false, print the list of tensors in `data`.
`summarize` determines how many entries of the tensors to print.
ł
AssignD
ref7Should be from a `Variable` node. May be uninitialized."T5
value)The value to be assigned to the variable."T

output_ref|= Same as "ref".  Returned as a convenience for operations that want
to use the new value after the variable has been reset."T"	
Ttype"Â
validate_shapebool("ĽIf true, the operation will validate that the shape
of 'value' matches the shape of the Tensor being assigned to.  If false,
'ref' will take on the shape of 'value'."
use_lockingbool("zIf True, the assignment will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*(Update 'ref' by assigning 'value' to it.2This operation outputs "ref" after the assignment is done.
This makes it easier to chain operations that need to use the reset value.
â
	AssignAdd.
ref!Should be from a `Variable` node."T2
value&The value to be added to the variable."T

output_ref~= Same as "ref".  Returned as a convenience for operations that want
to use the new value after the variable has been updated."T"
Ttype:
2	"
use_lockingbool( "xIf True, the addition will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*%Update 'ref' by adding 'value' to it.2This operation outputs "ref" after the update is done.
This makes it easier to chain operations that need to use the reset value.
ń
	AssignSub.
ref!Should be from a `Variable` node."T7
value+The value to be subtracted to the variable."T

output_ref~= Same as "ref".  Returned as a convenience for operations that want
to use the new value after the variable has been updated."T"
Ttype:
2	"
use_lockingbool( "{If True, the subtraction will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*,Update 'ref' by subtracting 'value' from it.2This operation outputs "ref" after the update is done.
This makes it easier to chain operations that need to use the reset value.
Ú
AvgPool>
value24-D with shape `[batch, height, width, channels]`."T.
output!The average pooled output tensor."T"U
ksize	list(int)"=The size of the sliding window for each dimension of `value`.(0"Y
strides	list(int)"?The stride of the sliding window for each dimension of `value`.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"Í
data_formatstringNHWC"Specify the data format of the input and output data. With the
default format "NHWC", the data is stored in the order of:
    [batch, in_height, in_width, in_channels].
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].:
NHWCNCHW"
Ttype:
2*&Performs average pooling on the input.2WEach entry in `output` is the mean of the corresponding size `ksize`
window in `value`.

AvgPoolGradF
orig_input_shape01-D.  Shape of the original input to `avg_pool`.i
grad^4-D with shape `[batch, height, width, channels]`.  Gradients w.r.t.
the output of `avg_pool`."T<
output/4-D.  Gradients w.r.t. the input of `avg_pool`."T"W
ksize	list(int)"?The size of the sliding window for each dimension of the input.(0"[
strides	list(int)"AThe stride of the sliding window for each dimension of the input.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"Í
data_formatstringNHWC"Specify the data format of the input and output data. With the
default format "NHWC", the data is stored in the order of:
    [batch, in_height, in_width, in_channels].
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].:
NHWCNCHW"
Ttype:
2*3Computes gradients of the average pooling function.
é
BatchCholesky#
inputShape is `[..., M, M]`."T$
outputShape is `[..., M, M]`."T"
Ttype:
2*DCalculates the Cholesky decomposition of a batch of square matrices.2łThe input is a tensor of shape `[..., M, M]` whose inner-most 2 dimensions
form square matrices, with the same constraints as the single matrix Cholesky
decomposition above. The output is a tensor of the same shape as the input
containing the Cholesky decompositions for all input submatrices `[..., :, :]`.

BatchFFT
inA complex64 tensor.
outyA complex64 tensor of the same shape as `in`. The inner-most dimension of
`in` is replaced with its 1D Fourier Transform.*HCompute the 1-dimensional discrete Fourier Transform over the inner-most2dimension of `in`.


BatchFFT2D
inA complex64 tensor.
outA complex64 tensor of the same shape as `in`. The inner-most 2 dimensions
of `in` are replaced with their 2D Fourier Transform.*HCompute the 2-dimensional discrete Fourier Transform over the inner-most22 dimensions of `in`.


BatchFFT3D
inA complex64 tensor.
outA complex64 tensor of the same shape as `in`. The inner-most 3 dimensions
of `in` are replaced with their 3D Fourier Transform.*JCompute the 3-dimensional discrete Fourier Transform over the inner-most 32dimensions of `in`.

	BatchIFFT
inA complex64 tensor.
outA complex64 tensor of the same shape as `in`. The inner-most dimension of
`in` is replaced with its inverse 1D Fourier Transform.*PCompute the inverse 1-dimensional discrete Fourier Transform over the inner-most2dimension of `in`.
§
BatchIFFT2D
inA complex64 tensor.
outA complex64 tensor of the same shape as `in`. The inner-most 2 dimensions
of `in` are replaced with their inverse 2D Fourier Transform.*PCompute the inverse 2-dimensional discrete Fourier Transform over the inner-most22 dimensions of `in`.
§
BatchIFFT3D
inA complex64 tensor.
outA complex64 tensor of the same shape as `in`. The inner-most 3 dimensions
of `in` are replaced with their inverse 3D Fourier Transform.*PCompute the inverse 3-dimensional discrete Fourier Transform over the inner-most23 dimensions of `in`.
č
BatchMatMul3
x+3-D or higher with shape `[..., r_x, c_x]`."T3
y+3-D or higher with shape `[..., r_y, c_y]`."T4
out*3-D or higher with shape `[..., r_o, c_o]`"T"
Ttype:
2"M
adj_xbool( ":If `True`, adjoint the slices of `x`. Defaults to `False`."M
adj_ybool( ":If `True`, adjoint the slices of `y`. Defaults to `False`.*,Multiplies slices of two tensors in batches.2×Multiplies all slices of `Tensor` `x` and `y` (each slice can be
viewed as an element of a batch), and arranges the individual results
in a single output tensor of the same batch size. Each of the
individual slices can optionally be adjointed (to adjoint a matrix
means to transpose and conjugate it) before multiplication by setting
the `adj_x` or `adj_y` flag to `True`, which are by default `False`.

The input tensors `x` and `y` are 3-D or higher with shape `[..., r_x, c_x]`
and `[..., r_y, c_y]`.

The output tensor is 3-D or higher with shape `[..., r_o, c_o]`, where:

    r_o = c_x if adj_x else r_x
    c_o = r_y if adj_y else c_y

It is computed as:

    out[..., :, :] = matrix(x[..., :, :]) * matrix(y[..., :, :])
đ
BatchMatrixDeterminant#
inputShape is `[..., M, M]`."T
outputShape is `[...]`."T"
Ttype:
2*;Calculates the determinants for a batch of square matrices.2ŔThe input is a tensor of shape `[..., M, M]` whose inner-most 2 dimensions
form square matrices. The output is a 1-D tensor containing the determinants
for all input submatrices `[..., :, :]`.
î
BatchMatrixDiag(
diagonalRank `k`, where `k >= 1`."TU
outputHRank `k+1`, with `output.shape = diagonal.shape + [diagonal.shape[-1]]`."T"	
Ttype*GReturns a batched diagonal tensor with a given batched diagonal values.2Given a `diagonal`, this operation returns a tensor with the `diagonal` and
everything else padded with zeros. The diagonal is computed as follows:

Assume `diagonal` has `k` dimensions `[I, J, K, ..., N]`, then the output is a
tensor of rank `k+1` with dimensions [I, J, K, ..., N, N]` where:

`output[i, j, k, ..., m, n] = 1{m=n} * diagonal[i, j, k, ..., n]`.

For example:

```prettyprint
# 'diagonal' is [[1, 2, 3, 4], [5, 6, 7, 8]]

and diagonal.shape = (2, 4)

tf.batch_matrix_diag(diagonal) ==> [[[1, 0, 0, 0]
                                     [0, 2, 0, 0]
                                     [0, 0, 3, 0]
                                     [0, 0, 0, 4]],
                                    [[5, 0, 0, 0]
                                     [0, 6, 0, 0]
                                     [0, 0, 7, 0]
                                     [0, 0, 0, 8]]]

which has shape (2, 4, 4)
```
ö
BatchMatrixDiagPartQ
inputERank `k` tensor where `k >= 2` and the last two dimensions are equal."TZ
diagonalKThe extracted diagonal(s) having shape
`diagonal.shape = input.shape[:-1]`."T"	
Ttype*6Returns the batched diagonal part of a batched tensor.2ěThis operation returns a tensor with the `diagonal` part
of the batched `input`. The `diagonal` part is computed as follows:

Assume `input` has `k` dimensions `[I, J, K, ..., N, N]`, then the output is a
tensor of rank `k - 1` with dimensions `[I, J, K, ..., N]` where:

`diagonal[i, j, k, ..., n] = input[i, j, k, ..., n, n]`.

The input must be at least a matrix.

For example:

```prettyprint
# 'input' is [[[1, 0, 0, 0]
               [0, 2, 0, 0]
               [0, 0, 3, 0]
               [0, 0, 0, 4]],
              [[5, 0, 0, 0]
               [0, 6, 0, 0]
               [0, 0, 7, 0]
               [0, 0, 0, 8]]]

and input.shape = (2, 4, 4)

tf.batch_matrix_diag_part(input) ==> [[1, 2, 3, 4], [5, 6, 7, 8]]

which has shape (2, 4)
```
´
BatchMatrixInverse#
inputShape is `[..., M, M]`."T$
outputShape is `[..., M, M]`."T"
Ttype:
2*5Calculates the inverse of square invertible matrices.2The input is a tensor of shape `[..., M, M]` whose inner-most 2 dimensions
form square matrices. The output is a tensor of the same shape as the input
containing the inverse for all input submatrices `[..., :, :]`.

The op uses the Cholesky decomposition if the matrices are symmetric positive
definite and LU decomposition with partial pivoting otherwise.

If a matrix is not invertible there is no guarantee what the op does. It
may detect the condition and raise an exception or it may simply return a
garbage result.
Ý
BatchMatrixSolve$
matrixShape is `[..., M, M]`."T!
rhsShape is `[..., M, K]`."T$
outputShape is `[..., M, K]`."T"c
adjointbool( "NBoolean indicating whether to solve with `matrix` or its (block-wise)
adjoint."
Ttype:
2*=Solves systems of linear equations. Checks for invertibility.2˘Matrix is a tensor of shape `[..., M, M]` whose inner-most 2 dimensions
form square matrices. Rhs is a tensor of shape
`[..., M, K]`. The output is a tensor shape `[..., M, K]`.  If `adjoint` is `False` then each output
matrix satisfies `matrix[..., :, :] * output[..., :, :] = rhs[..., :, :]`.
If `adjoint` is `True` then each output
matrix satisfies `adjoint(matrix[..., :, :]) * output[..., :, :] = rhs[..., :, :]`.

BatchMatrixSolveLs$
matrixShape is `[..., M, N]`."T!
rhsShape is `[..., M, K]`."T
l2_regularizer$
outputShape is `[..., N, K]`."T"
Ttype:
2"
fastbool(*.Solves multiple linear least-squares problems.2˘`matrix` is a tensor of shape `[..., M, N]` whose inner-most 2 dimensions
form square matrices. Rhs is a tensor of shape `[..., M, K]`. The output
is a tensor shape `[..., N, K]` where each output matrix solves each of
the equations matrix[..., :, :] * output[..., :, :] = rhs[..., :, :] in the
least squares sense.

Below we will use the following notation for each pair of
matrix and right-hand sides in the batch:

`matrix`=\\(A \in \Re^{m \times n}\\),
`rhs`=\\(B  \in \Re^{m \times k}\\),
`output`=\\(X  \in \Re^{n \times k}\\),
`l2_regularizer`=\\(\lambda\\).

If `fast` is `True`, then the solution is computed by solving the normal
equations using Cholesky decomposition. Specifically, if \\(m \ge n\\) then
\\(X = (A^T A + \lambda I)^{-1} A^T B\\), which solves the least-squares
problem \\(X = \mathrm{argmin}_{Z \in \Re^{n \times k}} ||A Z - B||_F^2 +
\lambda ||Z||_F^2\\). If \\(m \lt n\\) then `output` is computed as
\\(X = A^T (A A^T + \lambda I)^{-1} B\\), which (for \\(\lambda = 0\\)) is the
minimum-norm solution to the under-determined linear system, i.e.
\\(X = \mathrm{argmin}_{Z \in \Re^{n \times k}} ||Z||_F^2 \\), subject to
\\(A Z = B\\). Notice that the fast path is only numerically stable when
\\(A\\) is numerically full rank and has a condition number
\\(\mathrm{cond}(A) \lt \frac{1}{\sqrt{\epsilon_{mach}}}\\) or\\(\lambda\\) is
sufficiently large.

If `fast` is `False` an algorithm based on the numerically robust complete
orthogonal decomposition is used. This computes the minimum-norm
least-squares solution, even when \\(A\\) is rank deficient. This path is
typically 6-7 times slower than the fast path. If `fast` is `False` then
`l2_regularizer` is ignored.
Î	
BatchMatrixTriangularSolve$
matrixShape is `[..., M, M]`."T!
rhsShape is `[..., M, K]`."T$
outputShape is `[..., M, K]`."T"o
lowerbool("\Boolean indicating whether the innermost matrices in `matrix` are
lower or upper triangular."c
adjointbool( "NBoolean indicating whether to solve with `matrix` or its (block-wise)
adjoint."
Ttype:
2*MSolves systems of linear equations with upper or lower triangular matrices by2backsubstitution.

`matrix` is a tensor of shape `[..., M, M]` whose inner-most 2 dimensions form
square matrices. If `lower` is `True` then the strictly upper triangular part
of each inner-most matrix is assumed to be zero and not accessed.
If `lower` is False then the strictly lower triangular part of each inner-most
matrix is assumed to be zero and not accessed.
`rhs` is a tensor of shape [..., M, K]`.

The output is a tensor of shape `[..., M, K]`. If `adjoint` is `True` then the
innermost matrices in output` satisfy matrix equations
`matrix[..., :, :] * output[..., :, :] = rhs[..., :, :]`.
If `adjoint` is `False` then the strictly then the  innermost matrices in
`output` satisfy matrix equations
`adjoint(matrix[..., i, k]) * output[..., k, j] = rhs[..., i, j]`.
Ř
 BatchNormWithGlobalNormalization
tA 4D input Tensor."T
mA 1D mean Tensor with size matching the last dimension of t.
This is the first output from tf.nn.moments,
or a saved moving average thereof."T
vA 1D variance Tensor with size matching the last dimension of t.
This is the second output from tf.nn.moments,
or a saved moving average thereof."Tw
betalA 1D beta Tensor with size matching the last dimension of t.
An offset to be added to the normalized tensor."T­
gamma A 1D gamma Tensor with size matching the last dimension of t.
If "scale_after_normalization" is true, this tensor will be multiplied
with the normalized tensor."T
result"T"
Ttype:
2	"G
variance_epsilonfloat",A small float number to avoid dividing by 0."s
scale_after_normalizationbool"PA bool indicating whether the resulted tensor
needs to be multiplied with gamma.*Batch normalization.2:This op is deprecated. Prefer `tf.nn.batch_normalization`.
Î
$BatchNormWithGlobalNormalizationGrad
tA 4D input Tensor."T
mA 1D mean Tensor with size matching the last dimension of t.
This is the first output from tf.nn.moments,
or a saved moving average thereof."T
vA 1D variance Tensor with size matching the last dimension of t.
This is the second output from tf.nn.moments,
or a saved moving average thereof."T­
gamma A 1D gamma Tensor with size matching the last dimension of t.
If "scale_after_normalization" is true, this Tensor will be multiplied
with the normalized Tensor."T"
backprop4D backprop Tensor."T&
dx4D backprop tensor for input."T%
dm1D backprop tensor for mean."T)
dv 1D backprop tensor for variance."T%
db1D backprop tensor for beta."T&
dg1D backprop tensor for gamma."T"
Ttype:
2	"G
variance_epsilonfloat",A small float number to avoid dividing by 0."s
scale_after_normalizationbool"PA bool indicating whether the resulted tensor
needs to be multiplied with gamma.*"Gradients for batch normalization.27This op is deprecated. See `tf.nn.batch_normalization`.
ň
BatchSelfAdjointEig#
inputShape is `[..., M, M]`."T&
outputShape is `[..., M+1, M]`."T"
Ttype:
2*NCalculates the Eigen Decomposition of a batch of square self-adjoint matrices.2ŞThe input is a tensor of shape `[..., M, M]` whose inner-most 2 dimensions
form square matrices, with the same constraints as the single matrix
SelfAdjointEig.

The result is a '[..., M+1, M] matrix with [..., 0,:] containing the
eigenvalues, and subsequent [...,1:, :] containing the eigenvectors.

BiasAdd%
valueAny number of dimensions."T7
bias,1-D with size the last dimension of `value`."T3
output&Broadcasted sum of `value` and `bias`."T"
Ttype:
2	"
data_formatstringNHWC"ăSpecify the data format of the input and output data. With the
default format "NHWC", the bias tensor will be added to the last dimension
of the value tensor.
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].
The tensor will be added to "in_channels", the third-to-the-last
    dimension.:
NHWCNCHW*Adds `bias` to `value`.2This is a special case of `tf.add` where `bias` is restricted to be 1-D.
Broadcasting is supported, so `value` may have any number of dimensions.
ş
BiasAddGrad,
out_backpropAny number of dimensions."TC
output61-D with size the feature dimension of `out_backprop`."T"
Ttype:
2	"
data_formatstringNHWC"ăSpecify the data format of the input and output data. With the
default format "NHWC", the bias tensor will be added to the last dimension
of the value tensor.
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].
The tensor will be added to "in_channels", the third-to-the-last
    dimension.:
NHWCNCHW*:The backward operation for "BiasAdd" on the "bias" tensor.2ĆIt accumulates all the values from out_backprop into the feature dimension.
For NHWC data format, the feature dimension is the last. For NCHW data format,
the feature dimension is the third-to-last.
Ż
	BiasAddV1%
valueAny number of dimensions."T7
bias,1-D with size the last dimension of `value`."T3
output&Broadcasted sum of `value` and `bias`."T"
Ttype:
2	*Adds `bias` to `value`.2ÔThis is a deprecated version of BiasAdd and will be soon removed.

This is a special case of `tf.add` where `bias` is restricted to be 1-D.
Broadcasting is supported, so `value` may have any number of dimensions.
î
Bitcast

input"T
output"type"
Ttype:
2	" 
typetype:
2	*@Bitcasts a tensor from one type to another without copying data.2ĂGiven a tensor `input`, this operation returns a tensor that has the same buffer
data as `input` with datatype `type`.

If the input datatype `T` is larger than the output datatype `type` then the
shape changes from [...] to [..., sizeof(`T`)/sizeof(`type`)].

If `T` is smaller than `type`, the operator requires that the rightmost
dimension be equal to sizeof(`type`)/sizeof(`T`). The shape then goes from
[..., sizeof(`type`)/sizeof(`T`)] to [...].
Ř
BroadcastGradientArgs
s0
s1
r0
r1*PReturn the reduction indices for computing gradients of s0 op s1 with broadcast.2MThis is typically used by gradient computations for a broadcasting operation.
ĺ
CTCBeamSearchDecoderL
inputs@3-D, shape: `(max_time x batch_size x num_classes)`, the logits.J
sequence_length5A vector containing sequence lengths, size `(batch)`.Í
decoded_indicesŹA list (length: top_paths) of indices matrices.  Matrix j,
size `(total_decoded_outputs[j] x 2)`, has indices of a
`SparseTensor<int64, 2>`.  The rows store: [batch, time].	*	top_pathsă
decoded_valuesĂA list (length: top_paths) of values vectors.  Vector j,
size `(length total_decoded_outputs[j])`, has the values of a
`SparseTensor<int64, 2>`.  The vector stores the decoded classes for beam j.	*	top_pathsË
decoded_shapeŹA list (length: top_paths) of shape vector.  Vector j,
size `(2)`, stores the shape of the decoded `SparseTensor[j]`.
Its values are: `[batch_size, max_decoded_length[j]]`.	*	top_pathsc
log_probabilityNA matrix, shaped: `(batch_size x top_paths)`.  The
sequence log-probabilities.">

beam_widthint"'A scalar >= 0 (beam search beam width).(0"J
	top_pathsint"4A scalar >= 0, <= beam_width (controls output size).(0"F
merge_repeatedbool("*If true, merge repeated classes in output.*;Performs beam search decoding on the logits given in input.2¸A note about the attribute merge_repeated: For the beam search decoder,
this means that if consecutive entries in a beam are the same, only
the first of these is emitted.  That is, when the top path is "A B B B B",
"A B" is returned if merge_repeated = True but "A B B B B" is
returned if merge_repeated = False.
ç	
CTCGreedyDecoderL
inputs@3-D, shape: `(max_time x batch_size x num_classes)`, the logits.O
sequence_length:A vector containing sequence lengths, size `(batch_size)`.
decoded_indicesrIndices matrix, size `(total_decoded_outputs x 2)`,
of a `SparseTensor<int64, 2>`.  The rows store: [batch, time].	
decoded_valuesvValues vector, size: `(total_decoded_outputs)`,
of a `SparseTensor<int64, 2>`.  The vector stores the decoded classes.	y
decoded_shapefShape vector, size `(2)`, of the decoded SparseTensor.
Values are: `[batch_size, max_decoded_length]`.	\
log_probabilityGMatrix, size `(batch_size x 1)`, containing sequence
log-probabilities."F
merge_repeatedbool( "*If True, merge repeated classes in output.*7Performs greedy decoding on the logits given in inputs.2ÂA note about the attribute merge_repeated: if enabled, when
consecutive logits' maximum indices are the same, only the first of
these is emitted.  Labeling the blank '*', the sequence "A B B * B B"
becomes "A B" if merge_repeated = True and "A B B B B" if
merge_repeated = False.

Regardless of the value of merge_repeated, if the maximum index of a given
time and batch corresponds to the blank, index `(num_classes - 1)`, no new
element is emitted.
Ď
CTCLossL
inputs@3-D, shape: `(max_time x batch_size x num_classes)`, the logits. 
labels_indicesThe indices of a `SparseTensor<int32, 2>`.
`labels_indices(i, :) == [b, t]` means `labels_values(i)` stores the id for
`(batch b, time t)`.	P
labels_values=The values (labels) associated with the given batch and time.B
sequence_length-A vector containing sequence lengths (batch).8
loss.A vector (batch) containing log-probabilities.[
gradientMThe gradient of `loss`.  3-D, shape:
`(max_time x batch_size x num_classes)`."z
preprocess_collapse_repeatedbool( "PScalar, if true then repeated labels are
collapsed prior to the CTC calculation."Đ
ctc_merge_repeatedbool("ŻScalar.  If set to false, *during* CTC calculation
repeated non-blank labels will not be merged and are interpreted as
individual labels.  This is a simplified version of CTC.*PCalculates the CTC Loss (log probability) for each batch entry.  Also calculates2the gradient.  This class performs the softmax operation for you, so inputs
should be e.g. linear projections of outputs by an LSTM.
[
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype*!Cast x of type SrcT to y of DstT.
d
Ceil
x"T
y"T"
Ttype:
2*9Returns element-wise smallest integer in not less than x.
ą
CheckNumerics
tensor"T
output"T"
Ttype:
2"/
messagestring"Prefix of the error message.*'Checks a tensor for NaN and Inf values.2When run, reports an `InvalidArgument` error if `tensor` has any values
that are not a number (NaN) or infinity (Inf). Otherwise, passes `tensor` as-is.
 
Cholesky
inputShape is `[M, M]`."T
outputShape is `[M, M]`."T"
Ttype:
2*9Calculates the Cholesky decomposition of a square matrix.2The input has to be symmetric and positive definite. Only the lower-triangular
part of the input will be used for this operation. The upper-triangular part
will not be read.

The result is the lower-triangular matrix of the Cholesky decomposition of the
input.
Ď
Complex
real
imag
out*.Converts two real numbers to a complex number.2öGiven a tensor `real` representing the real part of a complex number, and a
tensor `imag` representing the imaginary part of a complex number, this
operation returns complex numbers elementwise of the form \\(a + bj\\), where
*a* represents the `real` part and *b* represents the `imag` part.

The input tensors `real` and `imag` must have the same shape.

For example:

```
# tensor 'real' is [2.25, 3.25]
# tensor `imag` is [4.75, 5.75]
tf.complex(real, imag) ==> [[2.25 + 4.75j], [3.25 + 5.75j]]
```
Ň

ComplexAbs
x
y*0Computes the complex absolute value of a tensor.2Given a tensor `x` of complex numbers, this operation returns a tensor of type
`float` that is the absolute value of each element in `x`. All elements in `x`
must be complex numbers of the form \\(a + bj\\). The absolute value is
computed as \\( \sqrt{a^2 + b^2}\\).

For example:

```
# tensor 'x' is [[-2.25 + 4.75j], [-3.25 + 5.75j]]
tf.complex_abs(x) ==> [5.25594902, 6.60492229]
```
ć
ComputeAccidentalHits@
true_classes.The true_classes output of UnpackSparseLabels.	J
sampled_candidates2The sampled_candidates output of CandidateSampler.	J
indices=A vector of indices corresponding to rows of true_candidates.
idsA vector of IDs of positions in sampled_candidates that match a true_label
for the row with the corresponding index in indices.	a
weightsTA vector of the same length as indices and ids, in which each element
is -FLOAT_MAX."3
num_trueint""Number of true labels per context."Ľ
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision.*OComputes the ids of the positions in sampled_candidates that match true_labels.2When doing log-odds NCE, the result of this op should be passed through a
SparseToDense op, then added to the logits of the sampled candidates. This has
the effect of 'removing' the sampled labels that match the true labels by
making the classifier sure that they are sampled labels.

Concath

concat_dimX0-D.  The dimension along which to concatenate.  Must be in the
range [0, rank(values)).
valuesThe `N` Tensors to concatenate. Their ranks and types must match,
and their sizes must match in all dimensions except `concat_dim`."T*NË
output˝A `Tensor` with the concatenation of values stacked along the
`concat_dim` dimension.  This tensor's shape matches that of `values` except
in `concat_dim` where it has the sum of the sizes."T"
Nint(0"	
Ttype*)Concatenates tensors along one dimension.

ConcatOffset9

concat_dim)The dimension along which to concatenate.U
shapeGThe `N` int32 vectors representing shape of tensors being concatenated.*N
offset*N"
Nint(0*4Computes offsets of concat inputs within its output.2For example:

```prettyprint
# 'x' is [2, 2, 7]
# 'y' is [2, 3, 7]
# 'z' is [2, 5, 7]
concat_offset(2, [x, y, z]) => [0, 0, 0], [0, 2, 0], [0, 5, 0]
```

Conj
in
out*2Returns the complex conjugate of a complex number.2ÍGiven a tensor `in` of complex numbers, this operation returns a tensor of
complex numbers that are the complex conjugate of each element in `in`. The
complex numbers in `in` must be of the form \\(a + bj\\), where *a* is the real
part and *b* is the imaginary part.

The complex conjugate returned by this operation is of the form \\(a - bj\\).

For example:

```
# tensor 'in' is [-2.25 + 4.75j, 3.25 + 5.75j]
tf.conj(in) ==> [-2.25 - 4.75j, 3.25 - 5.75j]
```
{
Const
output"dtype"6
valuetensor"%Attr `value` is the tensor to return."
dtypetype*Returns a constant tensor.
|
ControlTrigger*JDoes nothing. Serves as a control trigger for scheduling. Only useful as a2placeholder for control edges.

Conv2D

input"T
filter"T
output"T"
Ttype:
2"Ş
strides	list(int)"1-D of length 4.  The stride of the sliding window for each dimension
of `input`. Must be in the same order as the dimension specified with format."
use_cudnn_on_gpubool("I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"Í
data_formatstringNHWC"Specify the data format of the input and output data. With the
default format "NHWC", the data is stored in the order of:
    [batch, in_height, in_width, in_channels].
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].:
NHWCNCHW*BComputes a 2-D convolution given 4-D `input` and `filter` tensors.2Given an input tensor of shape `[batch, in_height, in_width, in_channels]`
and a filter / kernel tensor of shape
`[filter_height, filter_width, in_channels, out_channels]`, this op
performs the following:

1. Flattens the filter to a 2-D matrix with shape
   `[filter_height * filter_width * in_channels, output_channels]`.
2. Extracts image patches from the input tensor to form a *virtual*
   tensor of shape `[batch, out_height, out_width,
   filter_height * filter_width * in_channels]`.
3. For each patch, right-multiplies the filter matrix and the image patch
   vector.

In detail, with the default NHWC format,

    output[b, i, j, k] =
        sum_{di, dj, q} input[b, strides[1] * i + di, strides[2] * j + dj, q] *
                        filter[di, dj, q, k]

Must have `strides[0] = strides[3] = 1`.  For the most common case of the same
horizontal and vertices strides, `strides = [1, stride, stride, 1]`.
â	
Conv2DBackpropFilterG
input;4-D with shape `[batch, in_height, in_width, in_channels]`."TŞ
filter_sizesAn integer vector representing the tensor shape of `filter`,
where `filter` is a 4-D
`[filter_height, filter_width, in_channels, out_channels]` tensor.
out_backpropn4-D with shape `[batch, out_height, out_width, out_channels]`.
Gradients w.r.t. the output of the convolution."T
output4-D with shape
`[filter_height, filter_width, in_channels, out_channels]`.  Gradient w.r.t.
the `filter` input of the convolution."T"
Ttype:
2"­
strides	list(int)"The stride of the sliding window for each dimension of the input
of the convolution. Must be in the same order as the dimension specified with
format."
use_cudnn_on_gpubool("I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"Í
data_formatstringNHWC"Specify the data format of the input and output data. With the
default format "NHWC", the data is stored in the order of:
    [batch, in_height, in_width, in_channels].
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].:
NHWCNCHW*AComputes the gradients of convolution with respect to the filter.
ł	
Conv2DBackpropInput
input_sizesvAn integer vector representing the shape of `input`,
where `input` is a 4-D `[batch, height, width, channels]` tensor.W
filterJ4-D with shape
`[filter_height, filter_width, in_channels, out_channels]`."T
out_backpropn4-D with shape `[batch, out_height, out_width, out_channels]`.
Gradients w.r.t. the output of the convolution."Tw
outputj4-D with shape `[batch, in_height, in_width, in_channels]`.  Gradient
w.r.t. the input of the convolution."T"
Ttype:
2"­
strides	list(int)"The stride of the sliding window for each dimension of the input
of the convolution. Must be in the same order as the dimension specified with
format."
use_cudnn_on_gpubool("I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"Í
data_formatstringNHWC"Specify the data format of the input and output data. With the
default format "NHWC", the data is stored in the order of:
    [batch, in_height, in_width, in_channels].
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].:
NHWCNCHW*@Computes the gradients of convolution with respect to the input.
L
Cos
x"T
y"T"
Ttype:	
2	*Computes cos of x element-wise.
ó
	CountUpTo5
ref(Should be from a scalar `Variable` node."T
outputsA copy of the input before increment. If nothing else modifies the
input, the values produced will all be distinct."T"f
limitint"XIf incrementing ref would bring it above limit, instead generates an
'OutOfRange' error."
Ttype:
2	**Increments 'ref' until it reaches 'limit'.2This operation outputs "ref" after the update is done.  This makes it
easier to chain operations that need to use the updated value.
Ű
Cross.
a&A tensor containing 3-element vectors."T6
b.Another tensor, of same type and shape as `a`."TC
product5Pairwise cross product of the vectors in `a` and `b`."T"
Ttype:
2		*#Compute the pairwise cross product.2ĺ`a` and `b` must be the same shape; they can either be simple 3-element vectors,
or any shape where the innermost dimension is 3. In the latter case, each pair
of corresponding 3-element vectors is cross-multiplied independently.
¤
	DecodeCSV`
recordsSEach string is a record/row in the csv and all records should have
the same format.
record_defaultsOne tensor per column of the input record, with either a
scalar default value for that column or empty if the column is required.2OUT_TYPED
output0Each tensor will have the same shape as records.2OUT_TYPE"$
OUT_TYPE
list(type)(0:
2	"E
field_delimstring,")delimiter to separate fields in a record.*?Convert CSV records to tensors. Each column maps to one tensor.2RFC 4180 format is expected for the CSV records.
(https://tools.ietf.org/html/rfc4180)
Note that we allow leading and trailing spaces with int or float field.

DecodeJSONExamplen
json_examples[Each string is a JSON object serialized according to the JSON
mapping of the Example proto.
binary_exampleskEach string is a binary Example protocol buffer corresponding
to the respective element of `json_examples`.*GConvert JSON-encoded Example records to binary protocol buffer strings.2żThis op translates a tensor containing Example records, encoded using
the [standard JSON
mapping](https://developers.google.com/protocol-buffers/docs/proto3#json),
into a tensor containing the same records encoded as binary protocol
buffers. The resulting tensor can then be fed to any of the other
Example-parsing ops.
Ë

DecodeJpeg+
contents0-D.  The JPEG-encoded image.7
image,3-D with shape `[height, width, channels]`.."D
channelsint "/Number of color channels for the decoded image."$
ratioint"Downscaling ratio."m
fancy_upscalingbool("PIf true use a slower but nicer upscaling of the
chroma planes (yuv420/422 only)."X
try_recover_truncatedbool( "5If true try to recover an image from truncated input."q
acceptable_fractionfloat%  ?"LThe minimum required fraction of lines before a truncated
input is accepted.*.Decode a JPEG-encoded image to a uint8 tensor.2ţThe attr `channels` indicates the desired number of color channels for the
decoded image.

Accepted values are:

*   0: Use the number of channels in the JPEG-encoded image.
*   1: output a grayscale image.
*   3: output an RGB image.

If needed, the JPEG-encoded image is transformed to match the requested number
of color channels.

The attr `ratio` allows downscaling the image by an integer factor during
decoding.  Allowed values are: 1, 2, 4, and 8.  This is much faster than
downscaling the image later.
ů
	DecodePng*
contents0-D.  The PNG-encoded image.;
image+3-D with shape `[height, width, channels]`."dtype"D
channelsint "/Number of color channels for the decoded image."
dtypetype0:
2*7Decode a PNG-encoded image to a uint8 or uint16 tensor.2čThe attr `channels` indicates the desired number of color channels for the
decoded image.

Accepted values are:

*   0: Use the number of channels in the PNG-encoded image.
*   1: output a grayscale image.
*   3: output an RGB image.
*   4: output an RGBA image.

If needed, the PNG-encoded image is transformed to match the requested number
of color channels.

	DecodeRaw6
bytes+All the elements must have the same length.Ř
outputĂA Tensor with one more dimension than the input `bytes`.  The
added dimension will have size equal to the length of the elements
of `bytes` divided by the number of bytes to represent `out_type`."out_type"
out_typetype:
	2	"
little_endianbool("Whether the input `bytes` are in little-endian order.
Ignored for `out_type` values that are stored in a single byte like
`uint8`.*9Reinterpret the bytes of a string as a vector of numbers.

DeleteSessionTensor@
handle4The handle for a tensor stored in the session state.*9Delete the tensor specified by its handle in the session.
Ä
DepthToSpace

input"T
output"T"	
Ttype"I

block_sizeint"6The size of the spatial block, same as in Space2Depth.*#DepthToSpace for tensors of type T.2Rearranges data from depth into blocks of spatial data.
This is the reverse transformation of SpaceToDepth. More specifically,
this op outputs a copy of the input tensor where values from the `depth`
dimension are moved in spatial blocks to the `height` and `width` dimensions.
The attr `block_size` indicates the input block size and how the data is moved.

  * Chunks of data of size `block_size * block_size` from depth are rearranged
    into non-overlapping blocks of size `block_size x block_size`
  * The width the output tensor is `input_depth * block_size`, whereas the
    height is `input_height * block_size`.
  * The depth of the input tensor must be divisible by
    `block_size * block_size`.

That is, assuming the input is in the shape:
`[batch, height, width, depth]`,
the shape of the output will be:
`[batch, height*block_size, width*block_size, depth/(block_size*block_size)]`

This operation requires that the input tensor be of rank 4, and that
`block_size` be >=1 and that `block_size * block_size` be a divisor of the
input depth.

This operation is useful for resizing the activations between convolutions
(but keeping all data), e.g. instead of pooling. It is also useful for training
purely convolutional models.

For example, given this input of shape `[1, 1, 1, 4]`, and a block size of 2:

```prettyprint
x = [[[[1, 2, 3, 4]]]]

```

This operation will output a tensor of shape `[1, 2, 2, 1]`:

```prettyprint
   [[[[1], [2]],
     [[3], [4]]]]
```

Here, the input has a batch of 1 and each batch element has shape `[1, 1, 4]`,
the corresponding output will have 2x2 elements and will have a depth of
1 channel (1 = `4 / (block_size * block_size)`).
The output element shape is `[2, 2, 1]`.

For an input tensor with larger depth, here of shape `[1, 1, 1, 12]`, e.g.

```prettyprint
x = [[[[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]]]]
```

This operation, for block size of 2, will return the following tensor of shape
`[1, 2, 2, 3]`

```prettyprint
   [[[[1, 2, 3], [4, 5, 6]],
     [[7, 8, 9], [10, 11, 12]]]]

```

Similarly, for the following input of shape `[1 2 2 4]`, and a block size of 2:

```prettyprint
x =  [[[[1, 2, 3, 4],
       [5, 6, 7, 8]],
      [[9, 10, 11, 12],
       [13, 14, 15, 16]]]]
```

the operator will return the following tensor of shape `[1 4 4 1]`:

```prettyprint
x = [[ [1],   [2],  [5],  [6]],
     [ [3],   [4],  [7],  [8]],
     [ [9],  [10], [13],  [14]],
     [ [11], [12], [15],  [16]]]

```
ł	
DepthwiseConv2dNative

input"T
filter"T
output"T"
Ttype:
2"g
strides	list(int)"Q1-D of length 4.  The stride of the sliding window for each dimension
of `input`."I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*LComputes a 2-D depthwise convolution given 4-D `input` and `filter` tensors.2ŢGiven an input tensor of shape `[batch, in_height, in_width, in_channels]`
and a filter / kernel tensor of shape
`[filter_height, filter_width, in_channels, channel_multiplier]`, containing
`in_channels` convolutional filters of depth 1, `depthwise_conv2d` applies
a different filter to each input channel (expanding from 1 channel to
`channel_multiplier` channels for each), then concatenates the results
together. Thus, the output has `in_channels * channel_multiplier` channels.

for k in 0..in_channels-1
  for q in 0..channel_multiplier-1
    output[b, i, j, k * channel_multiplier + q] =
      sum_{di, dj} input[b, strides[1] * i + di, strides[2] * j + dj, k] *
                        filter[di, dj, k, q]

Must have `strides[0] = strides[3] = 1`.  For the most common case of the same
horizontal and vertices strides, `strides = [1, stride, stride, 1]`.
Ń
#DepthwiseConv2dNativeBackpropFilterG
input;4-D with shape `[batch, in_height, in_width, in_channels]`."T˛
filter_sizesAn integer vector representing the tensor shape of `filter`,
where `filter` is a 4-D
`[filter_height, filter_width, in_channels, depthwise_multiplier]` tensor.
out_backpropn4-D with shape `[batch, out_height, out_width, out_channels]`.
Gradients w.r.t. the output of the convolution."T
output4-D with shape
`[filter_height, filter_width, in_channels, out_channels]`.  Gradient w.r.t.
the `filter` input of the convolution."T"
Ttype:
2"j
strides	list(int)"TThe stride of the sliding window for each dimension of the input
of the convolution."I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*KComputes the gradients of depthwise convolution with respect to the filter.
˘
"DepthwiseConv2dNativeBackpropInput
input_sizesvAn integer vector representing the shape of `input`,
where `input` is a 4-D `[batch, height, width, channels]` tensor._
filterR4-D with shape
`[filter_height, filter_width, in_channels, depthwise_multiplier]`."T
out_backpropn4-D with shape `[batch, out_height, out_width, out_channels]`.
Gradients w.r.t. the output of the convolution."Tw
outputj4-D with shape `[batch, in_height, in_width, in_channels]`.  Gradient
w.r.t. the input of the convolution."T"
Ttype:
2"j
strides	list(int)"TThe stride of the sliding window for each dimension of the input
of the convolution."I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*JComputes the gradients of depthwise convolution with respect to the input.
Ţ
DeserializeManySparse[
serialized_sparseD2-D, The `N` serialized `SparseTensor` objects.
Must have 3 columns.
sparse_indices	
sparse_values"dtype
sparse_shape	"D
dtypetype"5The `dtype` of the serialized `SparseTensor` objects.*HDeserialize and concatenate `SparseTensors` from a serialized minibatch.2
The input `serialized_sparse` must be a string matrix of shape `[N x 3]` where
`N` is the minibatch size and the rows correspond to packed outputs of
`SerializeSparse`.  The ranks of the original `SparseTensor` objects
must all match.  When the final `SparseTensor` is created, it has rank one
higher than the ranks of the incoming `SparseTensor` objects
(they have been concatenated along a new row dimension).

The output `SparseTensor` object's shape values for all dimensions but the
first are the max across the input `SparseTensor` objects' shape values
for the corresponding dimensions.  Its first shape value is `N`, the minibatch
size.

The input `SparseTensor` objects' indices are assumed ordered in
standard lexicographic order.  If this is not the case, after this
step run `SparseReorder` to restore index ordering.

For example, if the serialized input is a `[2 x 3]` matrix representing two
original `SparseTensor` objects:

    index = [ 0]
            [10]
            [20]
    values = [1, 2, 3]
    shape = [50]

and

    index = [ 2]
            [10]
    values = [4, 5]
    shape = [30]

then the final deserialized `SparseTensor` will be:

    index = [0  0]
            [0 10]
            [0 20]
            [1  2]
            [1 10]
    values = [1, 2, 3, 4, 5]
    shape = [2 50]
ń
DestroyTemporaryVariable:
ref-A reference to the temporary variable tensor."T

value"T"	
Ttype"l
var_namestring"XName of the temporary variable, usually the name of the matching
'TemporaryVariable' op.*<Destroys the temporary variable and returns its final value.2ŐSets output to the value of the Tensor pointed to by 'ref', then destroys
the temporary variable called 'var_name'.
All other uses of 'ref' *must* have executed before this op.
This is typically achieved by chaining the ref through each assign op, or by
using control dependencies.

Outputs the final value of the tensor pointed to by 'ref'.
Ó
Diag2
diagonal#Rank k tensor where k is at most 3."T
output"T"
Ttype:
2	*7Returns a diagonal tensor with a given diagonal values.2ťGiven a `diagonal`, this operation returns a tensor with the `diagonal` and
everything else padded with zeros. The diagonal is computed as follows:

Assume `diagonal` has dimensions [D1,..., Dk], then the output is a tensor of
rank 2k with dimensions [D1,..., Dk, D1,..., Dk] where:

`output[i1,..., ik, i1,..., ik] = diagonal[i1, ..., ik]` and 0 everywhere else.

For example:

```prettyprint
# 'diagonal' is [1, 2, 3, 4]
tf.diag(diagonal) ==> [[1, 0, 0, 0]
                       [0, 2, 0, 0]
                       [0, 0, 3, 0]
                       [0, 0, 0, 4]]
```

DiagPart0
input$Rank k tensor where k is 2, 4, or 6."T&
diagonalThe extracted diagonal."T"
Ttype:
2	*(Returns the diagonal part of the tensor.2ěThis operation returns a tensor with the `diagonal` part
of the `input`. The `diagonal` part is computed as follows:

Assume `input` has dimensions `[D1,..., Dk, D1,..., Dk]`, then the output is a
tensor of rank `k` with dimensions `[D1,..., Dk]` where:

`diagonal[i1,..., ik] = input[i1, ..., ik, i1,..., ik]`.

For example:

```prettyprint
# 'input' is [[1, 0, 0, 0]
              [0, 2, 0, 0]
              [0, 0, 3, 0]
              [0, 0, 0, 4]]

tf.diag_part(input) ==> [1, 2, 3, 4]
```

Digamma
x"T
y"T"
Ttype:	
2	*HComputes Psi, the derivative of Lgamma (the log of the absolute value of2`Gamma(x)`), element-wise.
S
Div
x"T
y"T
z"T"
Ttype:

2	*Returns x / y element-wise.
Ľ
DrawBoundingBoxesN
imagesB4-D with shape `[batch, height, width, depth]`. A batch of images.U
boxesJ3-D with shape `[batch, num_bounding_boxes, 4]` containing bounding
boxes.s
outputg4-D with the same shape as `images`. The batch of input images with
bounding boxes drawn on the images.*)Draw bounding boxes on a batch of images.2ČOutputs a copy of `images` but draws on top of the pixels zero or more bounding
boxes specified by the locations in `boxes`. The coordinates of the each
bounding box in `boxes are encoded as `[y_min, x_min, y_max, x_max]`. The
bounding box coordinates are floats in `[0.0, 1.0]` relative to the width and
height of the underlying image.

For example, if an image is 100 x 200 pixels and the bounding box is
`[0.1, 0.5, 0.2, 0.9]`, the bottom-left and upper-right coordinates of the
bounding box will be `(10, 40)` to `(50, 180)`.

Parts of the bounding box may fall outside the image.


DynamicPartition	
data"TG

partitions7Any shape.  Indices in the range `[0, num_partitions)`.
outputs"T*num_partitions">
num_partitionsint"#The number of partitions to output.(0"	
Ttype*PPartitions `data` into `num_partitions` tensors using indices from `partitions`.2űFor each index tuple `js` of size `partitions.ndim`, the slice `data[js, ...]`
becomes part of `outputs[partitions[js]]`.  The slices with `partitions[js] = i`
are placed in `outputs[i]` in lexicographic order of `js`, and the first
dimension of `outputs[i]` is the number of entries in `partitions` equal to `i`.
In detail,

    outputs[i].shape = [sum(partitions == i)] + data.shape[partitions.ndim:]

    outputs[i] = pack([data[js, ...] for js if partitions[js] == i])

`data.shape` must start with `partitions.shape`.

For example:

    # Scalar partitions
    partitions = 1
    num_partitions = 2
    data = [10, 20]
    outputs[0] = []  # Empty with shape [0, 2]
    outputs[1] = [[10, 20]]

    # Vector partitions
    partitions = [0, 0, 1, 1, 0]
    num_partitions = 2
    data = [10, 20, 30, 40, 50]
    outputs[0] = [10, 20, 50]
    outputs[1] = [30, 40]

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/DynamicPartition.png" alt>
</div>
ĺ

DynamicStitch
indices*N
data"T*N
merged"T"
Nint(0"	
Ttype*CInterleave the values from the `data` tensors into a single tensor.2Ę	Builds a merged tensor such that

    merged[indices[m][i, ..., j], ...] = data[m][i, ..., j, ...]

For example, if each `indices[m]` is scalar or vector, we have

    # Scalar indices
    merged[indices[m], ...] = data[m][...]

    # Vector indices
    merged[indices[m][i], ...] = data[m][i, ...]

Each `data[i].shape` must start with the corresponding `indices[i].shape`,
and the rest of `data[i].shape` must be constant w.r.t. `i`.  That is, we
must have `data[i].shape = indices[i].shape + constant`.  In terms of this
`constant`, the output shape is

    merged.shape = [max(indices)] + constant

Values are merged in order, so if an index appears in both `indices[m][i]` and
`indices[n][j]` for `(m,i) < (n,j)` the slice `data[n][j]` will appear in the
merged result.

For example:

    indices[0] = 6
    indices[1] = [4, 1]
    indices[2] = [[5, 2], [0, 3]]
    data[0] = [61, 62]
    data[1] = [[41, 42], [11, 12]]
    data[2] = [[[51, 52], [21, 22]], [[1, 2], [31, 32]]]
    merged = [[1, 2], [11, 12], [21, 22], [31, 32], [41, 42],
              [51, 52], [61, 62]]

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/DynamicStitch.png" alt>
</div>
Ô
EditDistanceg
hypothesis_indicesOThe indices of the hypothesis list SparseTensor.
This is an N x R int64 matrix.	c
hypothesis_valuesKThe values of the hypothesis list SparseTensor.
This is an N-length vector."T`
hypothesis_shapeJThe shape of the hypothesis list SparseTensor.
This is an R-length vector.	]
truth_indicesJThe indices of the truth list SparseTensor.
This is an M x R int64 matrix.	Y
truth_valuesFThe values of the truth list SparseTensor.
This is an M-length vector."T'
truth_shapetruth indices, vector.	ľ
output¨A dense float tensor with rank R - 1.

For the example input:

    // hypothesis represents a 2x1 matrix with variable-length values:
    //   (0,0) = ["a"]
    //   (1,0) = ["b"]
    hypothesis_indices = [[0, 0, 0],
                          [1, 0, 0]]
    hypothesis_values = ["a", "b"]
    hypothesis_shape = [2, 1, 1]

    // truth represents a 2x2 matrix with variable-length values:
    //   (0,0) = []
    //   (0,1) = ["a"]
    //   (1,0) = ["b", "c"]
    //   (1,1) = ["a"]
    truth_indices = [[0, 1, 0],
                     [1, 0, 0],
                     [1, 0, 1],
                     [1, 1, 0]]
    truth_values = ["a", "b", "c", "a"]
    truth_shape = [2, 2, 2]
    normalize = true

The output will be:

    // output is a 2x2 matrix with edit distances normalized by truth lengths.
    output = [[inf, 1.0],  // (0,0): no truth, (0,1): no hypothesis
              [0.5, 1.0]]  // (1,0): addition, (1,1): no hypothesis"k
	normalizebool("Tboolean (if true, edit distances are normalized by length of truth).

The output is:"	
Ttype*=Computes the (possibly normalized) Levenshtein Edit Distance.2ÁThe inputs are variable-length sequences provided by SparseTensors
  (hypothesis_indices, hypothesis_values, hypothesis_shape)
and
  (truth_indices, truth_values, truth_shape).

The inputs are:
ý
Elu
features"T
activations"T"
Ttype:
2*NComputes exponential linear: `exp(features) - 1` if < 0, `features` otherwise.2rSee [Fast and Accurate Deep Network Learning by Exponential Linear Units (ELUs)
](http://arxiv.org/abs/1511.07289)
Đ
EluGradP
	gradients@The backpropagated gradients to the corresponding Elu operation."T=
outputs/The outputs of the corresponding Elu operation."Ta
	backpropsQThe gradients: `gradients * (outputs + 1)` if outputs < 0,
`gradients` otherwise."T"
Ttype:
2*>Computes gradients for the exponential linear (Elu) operation.


EncodeJpeg6
image+3-D with shape `[height, width, channels]`.&
contents0-D. JPEG-encoded image."C
formatstring "Per pixel image format.:
 	grayscalergb"[
qualityint_"GQuality of the compression from 0 to 100 (higher is better and slower)."Z
progressivebool( "AIf True, create a JPEG that loads progressively (coarse to fine)."X
optimize_sizebool( "=If True, spend CPU/RAM to reduce size with no quality change."U
chroma_downsamplingbool("4See http://en.wikipedia.org/wiki/Chroma_subsampling."
density_unitstringin"bUnit used to specify `x_density` and `y_density`:
pixels per inch (`'in'`) or centimeter (`'cm'`).:

incm":
	x_densityintŹ"#Horizontal pixels per density unit."8
	y_densityintŹ"!Vertical pixels per density unit."V
xmp_metadatastring ":If not empty, embed this XMP metadata in the image header.*JPEG-encode an image.2ń`image` is a 3-D uint8 Tensor of shape `[height, width, channels]`.

The attr `format` can be used to override the color format of the encoded
output.  Values can be:

*   `''`: Use a default format based on the number of channels in the image.
*   `grayscale`: Output a grayscale JPEG image.  The `channels` dimension
    of `image` must be 1.
*   `rgb`: Output an RGB JPEG image. The `channels` dimension
    of `image` must be 3.

If `format` is not specified or is the empty string, a default format is picked
in function of the number of channels in `image`:

*   1: Output a grayscale image.
*   3: Output an RGB image.
Ĺ
	EncodePng7
image+3-D with shape `[height, width, channels]`."T%
contents0-D. PNG-encoded image."3
compressionint˙˙˙˙˙˙˙˙˙"Compression level."
Ttype0:
2*PNG-encode an image.2ő`image` is a 3-D uint8 or uint16 Tensor of shape `[height, width, channels]`
where `channels` is:

*   1: for grayscale.
*   2: for grayscale + alpha.
*   3: for RGB.
*   4: for RGBA.

The ZLIB compression level, `compression`, can be -1 for the PNG-encoder
default or a value from 0 to 9.  9 is the highest compression level, generating
the smallest output, but is slower.
ř
Enter>
data3The tensor to be made available to the child frame."T'
outputThe same tensor as `data`."T"	
Ttype"2

frame_namestring"The name of the child frame."P
is_constantbool( "7If true, the output is constant within the child frame."T
parallel_iterationsint
"4The number of iterations allowed to run in parallel.*NCreates or finds a child frame, and makes `data` available to the child frame.2ÎThis op is used together with `Exit` to create loops in the graph.
The unique `frame_name` is used by the `Executor` to identify frames. If
`is_constant` is true, `output` is a constant in the child frame; otherwise
it may be changed in the child frame. At most `parallel_iterations` iterations
are run in parallel in the child frame.
q
Equal
x"T
y"T
z
"
Ttype:
2	*1Returns the truth value of (x == y) element-wise.
c
Erf
x"T
y"T"
Ttype:	
2	*6Computes the Gauss error function of `x` element-wise.
l
Erfc
x"T
y"T"
Ttype:	
2	*>Computes the complementary error function of `x` element-wise.
ĺ
Exit?
data4The tensor to be made available to the parent frame."T'
outputThe same tensor as `data`."T"	
Ttype*,Exits the current frame to its parent frame.2:Exit makes its input `data` available to the parent frame.
d
Exp
x"T
y"T"
Ttype:	
2	*7Computes exponential of x element-wise.  \\(y = e^x\\).



ExpandDims

input"T]
dimT0-D (scalar). Specifies the dimension index at which to
expand the shape of `input`.j
output]Contains the same data as `input`, but its shape has an additional
dimension of size 1 added."T"	
Ttype*/Inserts a dimension of 1 into a tensor's shape.2řGiven a tensor `input`, this operation inserts a dimension of 1 at the
dimension index `dim` of `input`'s shape. The dimension index `dim` starts at
zero; if you specify a negative number for `dim` it is counted backward from
the end.

This operation is useful if you want to add a batch dimension to a single
element. For example, if you have a single image of shape `[height, width,
channels]`, you can make it a batch of 1 image with `expand_dims(image, 0)`,
which will make the shape `[1, height, width, channels]`.

Other examples:

```prettyprint
# 't' is a tensor of shape [2]
shape(expand_dims(t, 0)) ==> [1, 2]
shape(expand_dims(t, 1)) ==> [2, 1]
shape(expand_dims(t, -1)) ==> [2, 1]

# 't2' is a tensor of shape [2, 3, 5]
shape(expand_dims(t2, 0)) ==> [1, 2, 3, 5]
shape(expand_dims(t2, 2)) ==> [2, 3, 1, 5]
shape(expand_dims(t2, 3)) ==> [2, 3, 5, 1]
```

This operation requires that:

`-1-input.dims() <= dim <= input.dims()`

This operation is related to `squeeze()`, which removes dimensions of
size 1.
Ç
ExtractGlimpse	
input
size
offsets
glimpse"
centeredbool("

normalizedbool("
uniform_noisebool(*)Extracts a glimpse from the input tensor.2Returns a set of windows called glimpses extracted at location
`offsets` from the input tensor. If the windows only partially
overlaps the inputs, the non overlapping areas will be filled with
random noise.

The result is a 4-D tensor of shape `[batch_size, glimpse_height,
glimpse_width, channels]`. The channels and batch dimensions are the
same as that of the input tensor. The height and width of the output
windows are specified in the `size` parameter.

The argument `normalized` and `centered` controls how the windows are

FFT
inA complex64 vector.*
out!The 1D Fourier Transform of `in`.*5Compute the 1-dimensional discrete Fourier Transform.

FFT2D
inA complex64 matrix.*
out!The 2D Fourier Transform of `in`.*5Compute the 2-dimensional discrete Fourier Transform.

FFT3D
inA complex64 3-D tensor.*
out!The 3D Fourier Transform of `in`.*5Compute the 3-dimensional discrete Fourier Transform.
É
	FIFOQueue'
handleThe handle to the queue."I
component_types
list(type)"&The type of each component in a value.(0"
shapeslist(shape)
 "The shape of each component in a value. The length of this attr must
be either 0 or the same as the length of component_types. If the length of
this attr is 0, the shapes of queue elements are not constrained, and
only one element may be dequeued at a time.("v
capacityint˙˙˙˙˙˙˙˙˙"XThe upper bound on the number of elements in this queue.
Negative numbers mean no limit."{
	containerstring "bIf non-empty, this queue is placed in the given container.
Otherwise, a default container is used."q
shared_namestring "VIf non-empty, this queue will be shared under the given name
across multiple sessions.*;A queue that produces elements in first-in first-out order.
1
Fact
fact*Output a fact about factorials.

Fill9
dims/1-D. Represents the shape of the output tensor.<
value00-D (scalar). Value to fill the returned tensor."T
output"T"	
Ttype*,Creates a tensor filled with a scalar value.2ÍThis operation creates a tensor of shape `dims` and fills it with `value`.

For example:

```prettyprint
# Output tensor has shape [2, 3].
fill([2, 3], 9) ==> [[9, 9, 9]
                     [9, 9, 9]]
```
ę
FixedLengthRecordReader9
reader_handle#The handle to reference the Reader."
header_bytesint "
record_bytesint"
footer_bytesint "|
	containerstring "cIf non-empty, this reader is placed in the given container.
Otherwise, a default container is used."
shared_namestring "wIf non-empty, this reader is named in the given bucket
with this shared_name. Otherwise, the node name is used instead.*7A Reader that outputs fixed-length records from a file.
Ź
FixedUnigramCandidateSampler
true_classesA batch_size * num_true matrix, in which each row contains the
IDs of the num_true target_classes in the corresponding original label.	o
sampled_candidatesWA vector of length num_sampled, in which each element is
the ID of a sampled candidate.	Ě
true_expected_count˛A batch_size * num_true matrix, representing
the number of times each candidate is expected to occur in a batch
of sampled candidates. If unique=true, then this is a probability.ę
sampled_expected_countÍA vector of length num_sampled, for each sampled
candidate representing the number of times the candidate is expected
to occur in a batch of sampled candidates.  If unique=true, then this is a
probability."7
num_trueint""Number of true labels per context.(0"J
num_sampledint"2Number of candidates to randomly sample per batch.(0"Ë
uniquebool"şIf unique is true, we sample with rejection, so that all sampled
candidates in a batch are unique. This requires some approximation to
estimate the post-rejection sampling probabilities."X
	range_maxint"BThe sampler will sample integers from the interval [0, range_max).(0"ę

vocab_filestring "ĎEach valid line in this file (which should have a CSV-like format)
corresponds to a valid word ID. IDs are in sequential order, starting from
num_reserved_ids. The last entry in each line is expected to be a value
corresponding to the count or relative probability. Exactly one of vocab_file
and unigrams needs to be passed to this op."Ű

distortionfloat%  ?"žThe distortion is used to skew the unigram probability distribution.
Each weight is first raised to the distortion's power before adding to the
internal unigram distribution. As a result, distortion = 1.0 gives regular
unigram sampling (as defined by the vocab file), and distortion = 0.0 gives
a uniform distribution."ń
num_reserved_idsint "ÓOptionally some reserved IDs can be added in the range [0,
..., num_reserved_ids) by the users. One use case is that a special unknown
word token is used as ID 0. These IDs will have a sampling probability of 0."

num_shardsint"ýA sampler can be used to sample from a subset of the original range
in order to speed up the whole computation through parallelism. This parameter
(together with 'shard') indicates the number of partitions that are being
used in the overall computation.(0" 
shardint "A sampler can be used to sample from a subset of the original range
in order to speed up the whole computation through parallelism. This parameter
(together with 'num_shards') indicates the particular partition number of a
sampler op, when partitioning is being used.("Ź
unigramslist(float)
 "A list of unigram counts or probabilities, one per ID in sequential
order. Exactly one of vocab_file and unigrams should be passed to this op."Ľ
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision.*LGenerates labels for candidate sampling with a learned unigram distribution.2ˇA unigram sampler could use a fixed unigram distribution read from a
file or passed in as an in-memory array instead of building up the distribution
from data on the fly. There is also an option to skew the distribution by
applying a distortion power to the weights.

The vocabulary file should be in CSV-like format, with the last field
being the weight associated with the word.

For each batch, this op picks a single set of sampled candidate labels.

The advantages of sampling candidates per-batch are simplicity and the
possibility of efficient dense matrix multiplication. The disadvantage is that
the sampled candidates must be chosen independently of the context and of the
true labels.
d
Floor
x"T
y"T"
Ttype:
2*8Returns element-wise largest integer not greater than x.
ŕ
Gather
params"Tparams
indices"Tindices
output"Tparams"
validate_indicesbool("
Tparamstype"
Tindicestype:
2	*3Gather slices from `params` according to `indices`.2`indices` must be an integer tensor of any dimension (usually 0-D or 1-D).
Produces an output tensor with shape `indices.shape + params.shape[1:]` where:

    # Scalar indices
    output[:, ..., :] = params[indices, :, ... :]

    # Vector indices
    output[i, :, ..., :] = params[indices[i], :, ... :]

    # Higher rank indices
    output[i, ..., j, :, ... :] = params[indices[i, ..., j], :, ..., :]

If `indices` is a permutation and `len(indices) == params.shape[0]` then
this operation will permute `params` accordingly.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/Gather.png" alt>
</div>

GatherNd@
params-R-D.  The tensor from which to gather values."TparamsN
indices9(N+1)-D.  Index tensor having shape `[d_0, ..., d_N, R]`."TindicesW
outputDN-D.  Values from `params` gathered from indices given by `indices`."Tparams"
Tparamstype"
Tindicestype:
2	*3Gather values from `params` according to `indices`.2°`indices` must be integer tensor, containing indices into `params`.
It must be shape `[d_0, ..., d_N, R]` where `R` is the rank of `params`.
The innermost dimension of `indices` (with length `R`) corresponds to the
indices of `params`.

Produces an output tensor with shape `[d_0, ..., d_{n-1}]` where:

    output[i, j, k, ...] = params[indices[i, j, k, ..., :]]

e.g. for `indices` a matrix:

    output[i] = params[indices[i, :]]
Ä
GetSessionHandle$
valueThe tensor to be stored."TB
handle6The handle for the tensor stored in the session state."	
Ttype*;Store the input tensor in the state of the current session.
ę
GetSessionTensor@
handle4The handle for a tensor stored in the session state.0
value The tensor for the given handle."dtype",
dtypetype"The type of the output value.*4Get the value of the tensor specified by its handle.
l
Greater
x"T
y"T
z
"
Ttype:
2		*0Returns the truth value of (x > y) element-wise.
r
GreaterEqual
x"T
y"T
z
"
Ttype:
2		*1Returns the truth value of (x >= y) element-wise.

HSVToRGBS
imagesG1-D or higher rank. HSV data to convert. Last dimension must be size 3.&
output`images` converted to RGB.*+Convert one or more images from HSV to RGB.2äOutputs a tensor of the same shape as the `images` tensor, containing the RGB
value of the pixels. The output is only well defined if the value in `images`
are in `[0,1]`.

See `rgb_to_hsv` for a description of the HSV encoding.
Ű
	HashTable'
table_handleHandle to a table."{
	containerstring "bIf non-empty, this table is placed in the given container.
Otherwise, a default container is used."l
shared_namestring "QIf non-empty, this table is shared under the given name across
multiple sessions."*
	key_dtypetype"Type of the table keys.".
value_dtypetype"Type of the table values.*%Creates a non-initialized hash table.2łThis op creates a hash table, specifying the type of its keys and values.
Before using the table you will have to initialize it.  After initialization the
table will be immutable.

HistogramSummary5
tag,Scalar.  Tag to use for the `Summary.Value`.=
values0Any shape. Values to use to build the histogram."T:
summary-Scalar. Serialized `Summary` protocol buffer."
Ttype0:
2		*5Outputs a `Summary` protocol buffer with a histogram.2ĺThe generated
[`Summary`](https://www.tensorflow.org/code/tensorflow/core/framework/summary.proto)
has one summary value containing a histogram for `values`.

This op reports an `InvalidArgument` error if any value is not finite.

IFFT
inA complex64 vector.2
out)The inverse 1D Fourier Transform of `in`.*=Compute the inverse 1-dimensional discrete Fourier Transform.

IFFT2D
inA complex64 matrix.2
out)The inverse 2D Fourier Transform of `in`.*=Compute the inverse 2-dimensional discrete Fourier Transform.

IFFT3D
inA complex64 3-D tensor.2
out)The inverse 3D Fourier Transform of `in`.*=Compute the inverse 3-dimensional discrete Fourier Transform.
~
Identity

input"T
output"T"	
Ttype*NReturn a tensor with the same shape and contents as the input tensor or value.

IdentityReader9
reader_handle#The handle to reference the Reader."|
	containerstring "cIf non-empty, this reader is placed in the given container.
Otherwise, a default container is used."
shared_namestring "wIf non-empty, this reader is named in the given bucket
with this shared_name. Otherwise, the node name is used instead.*@A Reader that outputs the queued work as both the key and value.2hTo use, enqueue strings in a Queue.  ReaderRead will take the front
work string and output (work, work).
¨
Igamma
a"T
x"T
z"T"
Ttype:
2*BCompute the lower regularized incomplete Gamma function `Q(a, x)`.2ŽThe lower regularized incomplete Gamma function is defined as:

```
P(a, x) = gamma(a, x) / Gamma(x) = 1 - Q(a, x)
```
where
```
gamma(a, x) = int_{0}^{x} t^{a-1} exp(-t) dt
```
is the lower incomplete Gamma function.

Note, above `Q(a, x)` (`Igammac`) is the upper regularized complete
Gamma function.
Ź
Igammac
a"T
x"T
z"T"
Ttype:
2*BCompute the upper regularized incomplete Gamma function `Q(a, x)`.2ąThe upper regularized incomplete Gamma function is defined as:

```
Q(a, x) = Gamma(a, x) / Gamma(x) = 1 - P(a, x)
```
where
```
Gamma(a, x) = int_{x}^{\infty} t^{a-1} exp(-t) dt
```
is the upper incomplete Gama function.

Note, above `P(a, x)` (`Igamma`) is the lower regularized complete
Gamma function.
Ő
Imag
in
out*/Returns the imaginary part of a complex number.2Given a tensor `in` of complex numbers, this operation returns a tensor of type
`float` that is the imaginary part of each element in `in`. All elements in `in`
must be complex numbers of the form \\(a + bj\\), where *a* is the real part
and *b* is the imaginary part returned by this operation.

For example:

```
# tensor 'in' is [-2.25 + 4.75j, 3.25 + 5.75j]
tf.imag(in) ==> [4.75, 5.75]
```
ě
ImageSummaryI
tag@Scalar. Used to build the `tag` attribute of the summary values.a
tensorT4-D of shape `[batch_size, height, width, channels]` where
`channels` is 1, 3, or 4."T:
summary-Scalar. Serialized `Summary` protocol buffer."O

max_imagesint"4Max number of batch elements to generate images for.(0"
Ttype0:
2"X
	bad_colortensorB:˙  ˙"/Color to use for pixels with non-finite values.*0Outputs a `Summary` protocol buffer with images.2ýThe summary has up to `max_images` summary values containing images. The
images are built from `tensor` which must be 4-D with shape `[batch_size,
height, width, channels]` and where `channels` can be:

*  1: `tensor` is interpreted as Grayscale.
*  3: `tensor` is interpreted as RGB.
*  4: `tensor` is interpreted as RGBA.

The images have the same number of channels as the input tensor. For float
input, the values are normalized one image at a time to fit in the range
`[0, 255]`.  `uint8` values are unchanged.  The op uses two different
normalization algorithms:

*  If the input values are all positive, they are rescaled so the largest one
   is 255.

*  If any input value is negative, the values are shifted so input value 0.0
   is at 127.  They are then rescaled so that either the smallest value is 0,
   or the largest one is 255.

The `tag` argument is a scalar `Tensor` of type `string`.  It is used to
build the `tag` of the summary values:

*  If `max_images` is 1, the summary value tag is '*tag*/image'.
*  If `max_images` is greater than 1, the summary value tags are
   generated sequentially as '*tag*/image/0', '*tag*/image/1', etc.

The `bad_color` argument is the color to use in the generated images for
non-finite input values.  It is a `unit8` 1-D tensor of length `channels`.
Each element must be in the range `[0, 255]` (It represents the value of a
pixel in the output image).  Non-finite values in the input tensor are
replaced by this tensor in the output image.  The default value is the color
red.
ň
ImmutableConst
tensor"dtype"+
dtypetype"Type of the returned tensor."-
shapeshape"Shape of the returned tensor."
memory_region_namestring"jName of readonly memory region used by the tensor, see
NewReadOnlyMemoryRegionFromFile in tensorflow::Env.*,Returns immutable tensor from memory region.2:The current implementation memmaps the tensor from a file.
ń
InTopK3
predictions"A `batch_size` x `classes` tensor.1
targets#A `batch_size` vector of class ids."T<
	precision-Computed Precision at `k` as a `bool Tensor`.
"D
kint":Number of top elements to look at for computing precision."
Ttype0:
2	*8Says whether the targets are in the top `K` predictions.2ŠThis outputs a `batch_size` bool array, an entry `out[i]` is `true` if the
prediction for the target class is among the top `k` predictions among
all predictions for example `i`. Note that the behavior of `InTopK` differs
from the `TopK` op in its handling of ties; if multiple classes have the
same prediction value and straddle the top-`k` boundary, all of those
classes are considered to be in the top `k`.

More formally, let

  \\(predictions_i\\) be the predictions for all classes for example `i`,
  \\(targets_i\\) be the target class for example `i`,
  \\(out_i\\) be the output for example `i`,

$$out_i = predictions_{i, targets_i} \in TopKIncludingTies(predictions_i)$$

InitializeTableA
table_handle,Handle to a table which will be initialized. 
keysKeys of type Tkey."Tkey:
values*Values of type Tval. Same shape as `keys`."Tval"
Tkeytype"
Tvaltype*JTable initializer that takes two tensors for keys and values respectively.
o
Inv
x"T
y"T"
Ttype:	
2	**Computes the reciprocal of x element-wise.2I.e., \\(y = 1 / x\\).
ö
InvertPermutation
x1-D.
y1-D.*-Computes the inverse permutation of a tensor.2This operation computes the inverse of an index permutation. It takes a 1-D
integer tensor `x`, which represents the indices of a zero-based array, and
swaps each value with its index position. In other words, for an output tensor
`y` and an input tensor `x`, this operation computes the following:

`y[x[i]] = i for i in [0, 1, ..., len(x) - 1]`

The values must include 0. There can be no duplicate values or negative values.

For example:

```prettyprint
# tensor `x` is [3, 4, 0, 2, 1]
invert_permutation(x) ==> [2, 4, 3, 0, 1]
```
U
IsFinite
x"T
y
"
Ttype:
2*'Returns which elements of x are finite.
O
IsInf
x"T
y
"
Ttype:
2*$Returns which elements of x are Inf.
O
IsNan
x"T
y
"
Ttype:
2*$Returns which elements of x are NaN.
°
IsVariableInitializedH
ref7Should be from a `Variable` node. May be uninitialized."dtype
is_initialized
";
dtypetype",The type of elements in the variable tensor.*-Checks whether a tensor has been initialized.2JOutputs boolean scalar indicating whether the tensor has been initialized.
Ň
L2Loss3
t+Typically 2-D, but may have any dimensions."T
output0-D."T"
Ttype:
2	*L2 Loss.2WComputes half the L2 norm of a tensor without the `sqrt`:

    output = sum(t ** 2) / 2
°
LRN
input4-D.

output"J
depth_radiusint"10-D.  Half-width of the 1-D normalization window."J
biasfloat%  ?"4An offset (usually positive to avoid dividing by 0)."8
alphafloat%  ?"!A scale factor, usually positive.""
betafloat%   ?"An exponent.*Local Response Normalization.2öThe 4-D `input` tensor is treated as a 3-D array of 1-D vectors (along the last
dimension), and each vector is normalized independently.  Within a given vector,
each component is divided by the weighted, squared sum of inputs within
`depth_radius`.  In detail,

    sqr_sum[a, b, c, d] =
        sum(input[a, b, c, d - depth_radius : d + depth_radius + 1] ** 2)
    output = input / (bias + alpha * sqr_sum) ** beta

For details, see [Krizhevsky et al., ImageNet classification with deep
convolutional neural networks (NIPS 2012)]
(http://papers.nips.cc/paper/4824-imagenet-classification-with-deep-convolutional-neural-networks).
ů
LRNGradC
input_grads24-D with shape `[batch, height, width, channels]`.C
input_image24-D with shape `[batch, height, width, channels]`.D
output_image24-D with shape `[batch, height, width, channels]`."
outputThe gradients for LRN."(
depth_radiusint"A depth radius."E
biasfloat%  ?"/An offset (usually > 0 to avoid dividing by 0)."8
alphafloat%  ?"!A scale factor, usually positive.""
betafloat%   ?"An exponent.*+Gradients for Local Response Normalization.
Ú
LearnedUnigramCandidateSampler
true_classesA batch_size * num_true matrix, in which each row contains the
IDs of the num_true target_classes in the corresponding original label.	o
sampled_candidatesWA vector of length num_sampled, in which each element is
the ID of a sampled candidate.	Ě
true_expected_count˛A batch_size * num_true matrix, representing
the number of times each candidate is expected to occur in a batch
of sampled candidates. If unique=true, then this is a probability.ę
sampled_expected_countÍA vector of length num_sampled, for each sampled
candidate representing the number of times the candidate is expected
to occur in a batch of sampled candidates.  If unique=true, then this is a
probability."7
num_trueint""Number of true labels per context.(0"J
num_sampledint"2Number of candidates to randomly sample per batch.(0"Ë
uniquebool"şIf unique is true, we sample with rejection, so that all sampled
candidates in a batch are unique. This requires some approximation to
estimate the post-rejection sampling probabilities."X
	range_maxint"BThe sampler will sample integers from the interval [0, range_max).(0"Ľ
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision.*LGenerates labels for candidate sampling with a learned unigram distribution.2See explanations of candidate sampling and the data formats at
go/candidate-sampling.

For each batch, this op picks a single set of sampled candidate labels.

The advantages of sampling candidates per-batch are simplicity and the
possibility of efficient dense matrix multiplication. The disadvantage is that
the sampled candidates must be chosen independently of the context and of the
true labels.
i
Less
x"T
y"T
z
"
Ttype:
2		*0Returns the truth value of (x < y) element-wise.
o
	LessEqual
x"T
y"T
z
"
Ttype:
2		*1Returns the truth value of (x <= y) element-wise.
r
Lgamma
x"T
y"T"
Ttype:	
2	*BComputes the log of the absolute value of `Gamma(x)` element-wise.
ü
LinSpace%
startFirst entry in the range."T#
stopLast entry in the range."T&
numNumber of values to generate.'
output1-D. The generated values."T"
Ttype:
2* Generates values in an interval.2A sequence of `num` evenly-spaced values are generated beginning at `start`.
If `num > 1`, the values in the sequence increase by `stop - start / num - 1`,
so that the last one is exactly `stop`.

For example:

```
tf.linspace(10.0, 12.0, 3, name="linspace") => [ 10.0  11.0  12.0]
```
Ó
ListDiff
x1-D. Values to keep."T
y1-D. Values to remove."T4
out*1-D. Values present in `x` but not in `y`."T9
idx01-D. Positions of `x` values preserved in `out`."	
Ttype*@Computes the difference between two lists of numbers or strings.2ĘGiven a list `x` and a list `y`, this operation returns a list `out` that
represents all values that are in `x` but not in `y`. The returned list `out`
is sorted in the same order that the numbers appear in `x` (duplicates are
preserved). This operation also returns a list `idx` that represents the
position of each `out` element in `x`. In other words:

`out[i] = x[idx[i]] for i in [0, 1, ..., len(out) - 1]`

For example, given this input:

```prettyprint
x = [1, 2, 3, 4, 5, 6]
y = [1, 3, 5]
```

This operation would return:

```prettyprint
out ==> [2, 4, 6]
idx ==> [1, 3, 5]
```
u
Log
x"T
y"T"
Ttype:	
2	*-Computes natural logarithm of x element-wise.2I.e., \\(y = \log_e x\\).


LogSoftmax8
logits+2-D with shape `[batch_size, num_classes]`."T(

logsoftmaxSame shape as `logits`."T"
Ttype:
2*!Computes log softmax activations.2hFor each batch `i` and class `j` we have

    logsoftmax[i, j] = logits[i, j] - log(sum(exp(logits[i])))
Ň
LogUniformCandidateSampler
true_classesA batch_size * num_true matrix, in which each row contains the
IDs of the num_true target_classes in the corresponding original label.	o
sampled_candidatesWA vector of length num_sampled, in which each element is
the ID of a sampled candidate.	Ě
true_expected_count˛A batch_size * num_true matrix, representing
the number of times each candidate is expected to occur in a batch
of sampled candidates. If unique=true, then this is a probability.ę
sampled_expected_countÍA vector of length num_sampled, for each sampled
candidate representing the number of times the candidate is expected
to occur in a batch of sampled candidates.  If unique=true, then this is a
probability."7
num_trueint""Number of true labels per context.(0"J
num_sampledint"2Number of candidates to randomly sample per batch.(0"Ë
uniquebool"şIf unique is true, we sample with rejection, so that all sampled
candidates in a batch are unique. This requires some approximation to
estimate the post-rejection sampling probabilities."X
	range_maxint"BThe sampler will sample integers from the interval [0, range_max).(0"Ľ
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision.*HGenerates labels for candidate sampling with a log-uniform distribution.2See explanations of candidate sampling and the data formats at
go/candidate-sampling.

For each batch, this op picks a single set of sampled candidate labels.

The advantages of sampling candidates per-batch are simplicity and the
possibility of efficient dense matrix multiplication. The disadvantage is that
the sampled candidates must be chosen independently of the context and of the
true labels.
V

LogicalAnd
x

y

z
*0Returns the truth value of x AND y element-wise.
J

LogicalNot
x

y
*.Returns the truth value of NOT x element-wise.
T
	LogicalOr
x

y

z
*/Returns the truth value of x OR y element-wise.
Ä
LookupTableFind)
table_handleHandle to the table.)
keysAny shape.  Keys to look up."Tin
default_value"Toutg
valuesWSame shape as `keys`.  Values found in the table, or `default_values`
for missing keys."Tout"
Tintype"
Touttype*;Looks up keys in a table, outputs the corresponding values.2The tensor `keys` must of the same type as the keys of the table.
The output `values` is of the type of the table values.

The scalar `default_value` is the value output for keys not present in the
table. It must also be of the same type as the table values.
˛
LookupTableSize)
table_handleHandle to the table.?
size5Scalar that contains number of elements in the table.	*3Computes the number of elements in the given table.

LoopCondP
inputEA boolean scalar, representing the branch predicate of the Switch op.
'
outputThe same tensor as `input`.
*!Forwards the input to the output.2_This operator represents the loop termination condition used by the
"pivot" switches of a loop.

MatMul
a"T
b"T
product"T"J
transpose_abool( "1If true, "a" is transposed before multiplication."J
transpose_bbool( "1If true, "b" is transposed before multiplication."
Ttype:
2**Multiply the matrix "a" by the matrix "b".2The inputs must be two-dimensional matrices and the inner dimension of
"a" (after being transposed if transpose_a is true) must match the
outer dimension of "b" (after being transposed if transposed_b is
true).

*Note*: The default kernel implementation for MatMul on GPUs uses
cublas.

MatchingFiles/
pattern"A (scalar) shell wildcard pattern..
	filenamesA vector of matching filenames.*,Returns the set of files matching a pattern.2~Note that this routine only supports wildcard characters in the
basename portion of the pattern, not in the directory portion.
ž
MatrixDeterminant'
inputA tensor of shape `[M, M]`."T=
output0A scalar, equal to the determinant of the input."T"
Ttype:
2*.Calculates the determinant of a square matrix.
÷
MatrixInverse
inputShape is `[M, M]`."TJ
output=Shape is `[M, M]` containing the matrix inverse of the input."T"
Ttype:
2*5Calculates the inverse of a square invertible matrix.2ŻThe op uses the Cholesky decomposition if the matrix is symmetric positive
definite and LU decomposition with partial pivoting otherwise.

If the matrix is not invertible there is no guarantee what the op does. It
may detect the condition and raise an exception or it may simply return a
garbage result.
Ŕ
MatrixSolve
matrixShape is `[M, M]`."T
rhsShape is `[M, K]`."TĆ
output¸Shape is `[M, K]`. If `adjoint` is `False` then `output` that solves
`matrix` * `output` = `rhs`. If `adjoint` is `True` then `output` that solves
`adjoint(matrix)` * `output` = `rhs`."T"V
adjointbool( "ABoolean indicating whether to solve with `matrix` or its adjoint."
Ttype:
2*>Solves a system of linear equations. Checks for invertibility.
Ň
MatrixSolveLs
matrixShape is `[M, N]`."T
rhsShape is `[M, K]`."T
l2_regularizert
outputgShape is `[N, K]` containing the tensor that solves
`matrix * output = rhs` in the least-squares sense."T"
Ttype:
2"
fastbool(*&Solves a linear least-squares problem.2Ş
Below we will use the following notation
`matrix`=\\(A \in \Re^{m \times n}\\),
`rhs`=\\(B  \in \Re^{m \times k}\\),
`output`=\\(X  \in \Re^{n \times k}\\),
`l2_regularizer`=\\(\lambda\\).

If `fast` is `True`, then the solution is computed by solving the normal
equations using Cholesky decomposition. Specifically, if \\(m \ge n\\) then
\\(X = (A^T A + \lambda I)^{-1} A^T B\\), which solves the least-squares
problem \\(X = \mathrm{argmin}_{Z \in \Re^{n \times k}} ||A Z - B||_F^2 +
\lambda ||Z||_F^2\\). If \\(m \lt n\\) then `output` is computed as
\\(X = A^T (A A^T + \lambda I)^{-1} B\\),
which (for \\(\lambda = 0\\)) is the minimum-norm solution to the
under-determined linear system, i.e.
\\(X = \mathrm{argmin}_{Z \in \Re^{n \times k}} ||Z||_F^2 \\),
subject to \\(A Z = B\\).
Notice that the fast path is only numerically stable when \\(A\\) is
numerically full rank and has a condition number
\\(\mathrm{cond}(A) \lt \frac{1}{\sqrt{\epsilon_{mach}}}\\)
or \\(\lambda\\) is sufficiently large.

If `fast` is `False` an algorithm based on the numerically robust complete
orthogonal decomposition is used. This computes the minimum-norm
least-squares solution, even when \\(A\\) is rank deficient. This path is
typically 6-7 times slower than the fast path. If `fast` is `False` then
`l2_regularizer` is ignored.

MatrixTriangularSolve
matrixShape is `[M, M]`."T
rhsShape is `[M, K]`."T
outputShape is `[M, K]`."T"S
lowerbool("@Boolean indicating whether `matrix` is lower or upper triangular"V
adjointbool( "ABoolean indicating whether to solve with `matrix` or its adjoint."
Ttype:
2*OSolves a system of linear equations with an upper or lower triangular matrix by2backsubstitution.

`matrix` is a matrix of shape `[M, M]`. If `lower` is `True` then the strictly
upper triangular part of `matrix` is assumed to be zero and not accessed.
If `lower` is False then the strictly lower triangular part of `matrix` is
assumed to be zero and not accessed.
`rhs` is a matrix of shape [M, K]`.

The output is a matrix of shape `[M, K]`. If `adjoint` is `False` the output
satisfies the matrix equation `matrix` * `output` = `rhs`.
If `adjoint` is `False` then `output` satisfies the matrix equation
`matrix` * `output` = `rhs`.
If `adjoint` is `True` then `output` satisfies the matrix equation
`adjoint(matrix)` * `output` = `rhs`.
 
Max!
inputThe tensor to reduce."T0
reduction_indicesThe dimensions to reduce. 
outputThe reduced tensor."T"H
	keep_dimsbool( "1If true, retain reduced dimensions with length 1."
Ttype:
2	*?Computes the maximum of elements across dimensions of a tensor.2÷Reduces `input` along the dimensions given in `reduction_indices`. Unless
`keep_dims` is true, the rank of the tensor is reduced by 1 for each entry in
`reduction_indices`. If `keep_dims` is true, the reduced dimensions are
retained with length 1.
Ó
MaxPool"
input4-D input to pool over.)
outputThe max pooled output tensor."V
ksize	list(int)">The size of the window for each dimension of the input tensor.(0"b
strides	list(int)"HThe stride of the sliding window for each dimension of the
input tensor.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"Í
data_formatstringNHWC"Specify the data format of the input and output data. With the
default format "NHWC", the data is stored in the order of:
    [batch, in_height, in_width, in_channels].
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].:
NHWCNCHW*"Performs max pooling on the input.
á
MaxPoolGrad*

orig_inputThe original input tensor.,
orig_outputThe original output tensor.:
grad04-D.  Gradients w.r.t. the output of `max_pool`.5
output)Gradients w.r.t. the input to `max_pool`."V
ksize	list(int)">The size of the window for each dimension of the input tensor.(0"b
strides	list(int)"HThe stride of the sliding window for each dimension of the
input tensor.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"Í
data_formatstringNHWC"Specify the data format of the input and output data. With the
default format "NHWC", the data is stored in the order of:
    [batch, in_height, in_width, in_channels].
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].:
NHWCNCHW*.Computes gradients of the maxpooling function.

MaxPoolGradWithArgmax
inputThe original input.h
grad^4-D with shape `[batch, height, width, channels]`.  Gradients w.r.t. the
output of `max_pool`.Z
argmaxGThe indices of the maximum values chosen for each output of `max_pool`."Targmax5
output)Gradients w.r.t. the input of `max_pool`."V
ksize	list(int)">The size of the window for each dimension of the input tensor.(0"b
strides	list(int)"HThe stride of the sliding window for each dimension of the
input tensor.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"
Targmaxtype:
2	*.Computes gradients of the maxpooling function.

MaxPoolWithArgmaxR
inputG4-D with shape `[batch, height, width, channels]`.  Input to pool over.)
outputThe max pooled output tensor.X
argmaxE4-D.  The flattened indices of the max values chosen for each output."Targmax"V
ksize	list(int)">The size of the window for each dimension of the input tensor.(0"b
strides	list(int)"HThe stride of the sliding window for each dimension of the
input tensor.(0"
Targmaxtype0	:
2	"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*JPerforms max pooling on the input and outputs both max values and indices.2˘The indices in `argmax` are flattened, so that a maximum value at position
`[b, y, x, c]` becomes flattened index
`((b * height + y) * width + x) * channels + c`.

Maximum
x"T
y"T
z"T"
Ttype:
2	*IReturns the max of x and y (i.e. x > y ? x : y) element-wise, broadcasts.

Mean!
inputThe tensor to reduce."T0
reduction_indicesThe dimensions to reduce. 
outputThe reduced tensor."T"H
	keep_dimsbool( "1If true, retain reduced dimensions with length 1."
Ttype:
2	*<Computes the mean of elements across dimensions of a tensor.2÷Reduces `input` along the dimensions given in `reduction_indices`. Unless
`keep_dims` is true, the rank of the tensor is reduced by 1 for each entry in
`reduction_indices`. If `keep_dims` is true, the reduced dimensions are
retained with length 1.
ů
MergeN
inputs>The input tensors, exactly one of which will become available."T*N7
output*Will be set to the available input tensor."TB
value_index1The index of the chosen input tensor in `inputs`."	
Ttype"
Nint(0*DForwards the value of an available tensor from `inputs` to `output`.2Ă`Merge` waits for at least one of the tensors in `inputs` to become available.
It is usually combined with `Switch` to implement branching.

`Merge` forwards the first tensor for become available to `output`, and sets
`value_index` to its index in `inputs`.

It is an error if more than one tensor in `inputs` is available.
˙
MergeSummary]
inputsNCan be of any shape.  Each must contain serialized `Summary` protocol
buffers.*N:
summary-Scalar. Serialized `Summary` protocol buffer."
Nint(0*Merges summaries.2˛This op creates a
[`Summary`](https://www.tensorflow.org/code/tensorflow/core/framework/summary.proto)
protocol buffer that contains the union of all the values in the input
summaries.

When the Op is run, it reports an `InvalidArgument` error if multiple values
in the summaries to merge use the same tag.
 
Min!
inputThe tensor to reduce."T0
reduction_indicesThe dimensions to reduce. 
outputThe reduced tensor."T"H
	keep_dimsbool( "1If true, retain reduced dimensions with length 1."
Ttype:
2	*?Computes the minimum of elements across dimensions of a tensor.2÷Reduces `input` along the dimensions given in `reduction_indices`. Unless
`keep_dims` is true, the rank of the tensor is reduced by 1 for each entry in
`reduction_indices`. If `keep_dims` is true, the reduced dimensions are
retained with length 1.

Minimum
x"T
y"T
z"T"
Ttype:
2	*IReturns the min of x and y (i.e. x < y ? x : y) element-wise, broadcasts.
ń
	MirrorPad*
inputThe input tensor to be padded."T{
paddingsmA two-column matrix specifying the padding sizes. The number of
rows must be the same as the rank of `input`.
outputThe padded tensor."T"	
Ttype"ó
modestring"ĘEither `REFLECT` or `SYMMETRIC`. In reflect mode the padded regions
do not include the borders, while in symmetric mode the padded regions
do include the borders. For example, if `input` is `[1, 2, 3]` and `paddings`
is `[0, 2]`, then the output is `[1, 2, 3, 2, 1]` in reflect mode, and
it is `[1, 2, 3, 3, 2]` in symmetric mode.:
REFLECT	SYMMETRIC*#Pads a tensor with mirrored values.2óThis operation pads a `input` with mirrored values according to the `paddings`
you specify. `paddings` is an integer tensor with shape `[n, 2]`, where n is
the rank of `input`. For each dimension D of `input`, `paddings[D, 0]` indicates
how many values to add before the contents of `input` in that dimension, and
`paddings[D, 1]` indicates how many values to add after the contents of `input`
in that dimension. Both `paddings[D, 0]` and `paddings[D, 1]` must be no greater
than `input.dim_size(D)` (or `input.dim_size(D) - 1`) if `copy_border` is true
(if false, respectively).

The padded size of each dimension D of the output is:

`paddings(D, 0) + input.dim_size(D) + paddings(D, 1)`

For example:

```prettyprint
# 't' is [[1, 2, 3], [4, 5, 6]].
# 'paddings' is [[1, 1]], [2, 2]].
# 'mode' is SYMMETRIC.
# rank of 't' is 2.
pad(t, paddings) ==> [[2, 1, 1, 2, 3, 3, 2]
                      [2, 1, 1, 2, 3, 3, 2]
                      [5, 4, 4, 5, 6, 6, 5]
                      [5, 4, 4, 5, 6, 6, 5]]
```

MirrorPadGrad*
inputThe input tensor to be folded."T{
paddingsmA two-column matrix specifying the padding sizes. The number of
rows must be the same as the rank of `input`.
outputThe folded tensor."T"	
Ttype"L
modestring"$The mode used in the `MirrorPad` op.:
REFLECT	SYMMETRIC*EGradient op for `MirrorPad` op. This op folds a mirror-padded tensor.2This operation folds the padded areas of `input` by `MirrorPad` according to the
`paddings` you specify. `paddings` must be the same as `paddings` argument
given to the corresponding `MirrorPad` op.

The folded size of each dimension D of the output is:

`input.dim_size(D) - paddings(D, 0) - paddings(D, 1)`

For example:

```prettyprint
# 't' is [[1, 2, 3], [4, 5, 6], [7, 8, 9]].
# 'paddings' is [[0, 1]], [0, 1]].
# 'mode' is SYMMETRIC.
# rank of 't' is 2.
pad(t, paddings) ==> [[ 1,  5]
                      [11, 28]]
```
_
Mod
x"T
y"T
z"T"
Ttype:
2	*+Returns element-wise remainder of division.
V
Mul
x"T
y"T
z"T"
Ttype:

2	*Returns x * y element-wise.
q
Neg
x"T
y"T"
Ttype:	
2	*/Computes numerical negative value element-wise.2I.e., \\(y = -x\\).
Ë
NegTrain"
w_ininput word embedding.$
w_outoutput word embedding.#
examplesA vector of word ids.!
labelsA vector of word ids.
lr";
vocab_count	list(int)"!Count of words in the vocabulary."D
num_negative_samplesint"'Number of negative samples per example.*Training via negative sampling.
¸
NextIterationA
data6The tensor to be made available to the next iteration."T'
outputThe same tensor as `data`."T"	
Ttype*0Makes its input available to the next iteration.
E
NoOp*=Does nothing. Only useful as a placeholder for control edges.
t
NotEqual
x"T
y"T
z
"
Ttype:
2	*1Returns the truth value of (x != y) element-wise.
ť
OneHot!
indicesA tensor of indices.	@
depth5A scalar defining the depth of the one hot dimension.S
on_valueDA scalar defining the value to fill in output when `indices[j] = i`."TU
	off_valueEA scalar defining the value to fill in output when `indices[j] != i`."T 
outputThe one-hot tensor."T"P
axisint˙˙˙˙˙˙˙˙˙"6The axis to fill (default: -1, a new inner-most axis)."	
Ttype*Returns a one-hot tensor.2The locations represented by indices in `indices` take value `on_value`,
while all other locations take value `off_value`.

If the input `indices` is rank `N`, the output will have rank `N+1`,
The new axis is created at dimension `axis` (default: the new axis is
appended at the end).

If `indices` is a scalar the output shape will be a vector of length `depth`.

If `indices` is a vector of length `features`, the output shape will be:
```
  features x depth if axis == -1
  depth x features if axis == 0
```

If `indices` is a matrix (batch) with shape `[batch, features]`,
the output shape will be:
```
  batch x features x depth if axis == -1
  batch x depth x features if axis == 1
  depth x batch x features if axis == 0
```


Examples
=========

Suppose that

```
  indices = [0, 2, -1, 1]
  depth = 3
  on_value = 5.0
  off_value = 0.0
  axis = -1
```

Then output is `[4 x 3]`:

    ```output =
      [5.0 0.0 0.0]  // one_hot(0)
      [0.0 0.0 5.0]  // one_hot(2)
      [0.0 0.0 0.0]  // one_hot(-1)
      [0.0 5.0 0.0]  // one_hot(1)
    ```

Suppose that

```
  indices = [0, 2, -1, 1]
  depth = 3
  on_value = 0.0
  off_value = 3.0
  axis = 0
```

Then output is `[3 x 4]`:

    ```output =
      [0.0 3.0 3.0 3.0]
      [3.0 3.0 3.0 0.0]
      [3.0 3.0 3.0 3.0]
      [3.0 0.0 3.0 3.0]
    //  ^                one_hot(0)
    //      ^            one_hot(2)
    //          ^        one_hot(-1)
    //              ^    one_hot(1)
    ```
Suppose that

```
  indices = [[0, 2], [1, -1]]
  depth = 3
  on_value = 1.0
  off_value = 0.0
  axis = -1
```

Then output is `[2 x 2 x 3]`:

    ```output =
      [
        [1.0, 0.0, 0.0]  // one_hot(0)
        [0.0, 0.0, 1.0]  // one_hot(2)
      ][
        [0.0, 1.0, 0.0]  // one_hot(1)
        [0.0, 0.0, 0.0]  // one_hot(-1)
      ]```

Pack/
valuesMust be of same shape and type."T*N
outputThe packed tensor."T"
Nint(0"	
Ttype*BPacks a list of `N` rank-`R` tensors into one rank-`(R+1)` tensor.2ßPacks the `N` tensors in `values` into a tensor with rank one higher than each
tensor in `values` and shape `[N] + values[0].shape`. The output satisfies
`output[i, ...] = values[i][...]`.

This is the opposite of `unpack`.
é
Pad

input"T
paddings
output"T"	
Ttype*Pads a tensor with zeros.2This operation pads a `input` with zeros according to the `paddings` you
specify. `paddings` is an integer tensor with shape `[Dn, 2]`, where n is the
rank of `input`. For each dimension D of `input`, `paddings[D, 0]` indicates
how many zeros to add before the contents of `input` in that dimension, and
`paddings[D, 1]` indicates how many zeros to add after the contents of `input`
in that dimension.

The padded size of each dimension D of the output is:

`paddings(D, 0) + input.dim_size(D) + paddings(D, 1)`

For example:

```prettyprint
# 't' is [[1, 1], [2, 2]]
# 'paddings' is [[1, 1], [2, 2]]
# rank of 't' is 2
pad(t, paddings) ==> [[0, 0, 0, 0, 0, 0]
                      [0, 0, 1, 1, 0, 0]
                      [0, 0, 2, 2, 0, 0]
                      [0, 0, 0, 0, 0, 0]]
```
Đ

PaddingFIFOQueue'
handleThe handle to the queue."I
component_types
list(type)"&The type of each component in a value.(0"˝
shapeslist(shape)
 "The shape of each component in a value. The length of this attr must
be either 0 or the same as the length of component_types.
Shapes of fixed rank but variable size are allowed by setting
any shape dimension to -1.  In this case, the inputs' shape may vary along
the given dimension, and DequeueMany will pad the given dimension with
zeros up to the maximum shape of all elements in the given batch.
If the length of this attr is 0, different queue elements may have
different ranks and shapes, but only one element may be dequeued at a time.("v
capacityint˙˙˙˙˙˙˙˙˙"XThe upper bound on the number of elements in this queue.
Negative numbers mean no limit."{
	containerstring "bIf non-empty, this queue is placed in the given container.
Otherwise, a default container is used."q
shared_namestring "VIf non-empty, this queue will be shared under the given name
across multiple sessions.*;A queue that produces elements in first-in first-out order.2ßVariable-size shapes are allowed by setting the corresponding shape dimensions
to 0 in the shape attr.  In this case DequeueMany will pad up to the maximum
size of any given element in the minibatch.  See below for details.
ż
ParseExampleP

serialized@A vector containing a batch of binary serialized Example protos.
namesA vector containing the names of the serialized protos.
May contain, for example, table key (descriptive) names for the
corresponding serialized protos.  These are purely useful for debugging
purposes, and the presence of values here has no effect on the output.
May also be an empty vector if no names are available.
If non-empty, this vector must be the same length as "serialized".
sparse_keysvA list of Nsparse string Tensors (scalars).
The keys expected in the Examples' features associated with sparse values.*Nsparse

dense_keystA list of Ndense string Tensors (scalars).
The keys expected in the Examples' features associated with dense values.*Ndense
dense_defaults˙A list of Ndense Tensors (some may be empty).
dense_defaults[j] provides default values
when the example's feature_map lacks dense_key[j].  If an empty Tensor is
provided for dense_defaults[j], then the Feature dense_keys[j] is required.
The input type is inferred from dense_defaults[j], even when it's empty.
If dense_defaults[j] is not empty, its shape must match dense_shapes[j].2Tdense
sparse_indices	*Nsparse
sparse_values2sparse_types
sparse_shapes	*Nsparse
dense_values2Tdense"
Nsparseint("
Ndenseint("č
sparse_types
list(type)"ŔA list of Nsparse types; the data types of data in each Feature
given in sparse_keys.
Currently the ParseExample supports DT_FLOAT (FloatList),
DT_INT64 (Int64List), and DT_STRING (BytesList).(:
2	"
Tdense
list(type)(:
2	"Ą
dense_shapeslist(shape)"A list of Ndense shapes; the shapes of data in each Feature
given in dense_keys.
The number of elements in the Feature corresponding to dense_key[j]
must always equal dense_shapes[j].NumEntries().
If dense_shapes[j] == (D0, D1, ..., DN) then the shape of output
Tensor dense_values[j] will be (|serialized|, D0, D1, ..., DN):
The dense outputs are just the inputs row-stacked by batch.(*LTransforms a vector of brain.Example protos (as strings) into typed tensors.
Ţ
ParseSingleSequenceExampleN

serialized>A scalar containing a binary serialized SequenceExample proto. 
(feature_list_dense_missing_assumed_emptyńA vector listing the
FeatureList keys which may be missing from the SequenceExample.  If the
associated FeatureList is missing, it is treated as empty.  By default,
any FeatureList not listed in this vector must exist in the SequenceExample.ą
context_sparse_keysA list of Ncontext_sparse string Tensors (scalars).
The keys expected in the Examples' features associated with context_sparse
values.*Ncontext_sparseľ
context_dense_keysA list of Ncontext_dense string Tensors (scalars).
The keys expected in the SequenceExamples' context features associated with
dense values.*Ncontext_dense˛
feature_list_sparse_keys~A list of Nfeature_list_sparse string Tensors
(scalars).  The keys expected in the FeatureLists associated with sparse
values.*Nfeature_list_sparseĘ
feature_list_dense_keysA list of Nfeature_list_dense string Tensors (scalars).
The keys expected in the SequenceExamples' feature_lists associated
with lists of dense values.*Nfeature_list_denseň
context_dense_defaultsÇA list of Ncontext_dense Tensors (some may be empty).
context_dense_defaults[j] provides default values
when the SequenceExample's context map lacks context_dense_key[j].
If an empty Tensor is provided for context_dense_defaults[j],
then the Feature context_dense_keys[j] is required.
The input type is inferred from context_dense_defaults[j], even when it's
empty.  If context_dense_defaults[j] is not empty, its shape must match
context_dense_shapes[j].2Tcontext_denseĆ

debug_nameľA scalar containing the name of the serialized proto.
May contain, for example, table key (descriptive) name for the
corresponding serialized proto.  This is purely useful for debugging
purposes, and the presence of values here has no effect on the output.
May also be an empty scalar if no name is available.+
context_sparse_indices	*Ncontext_sparse-
context_sparse_values2context_sparse_types*
context_sparse_shapes	*Ncontext_sparse&
context_dense_values2Tcontext_dense5
feature_list_sparse_indices	*Nfeature_list_sparse7
feature_list_sparse_values2feature_list_sparse_types4
feature_list_sparse_shapes	*Nfeature_list_sparse5
feature_list_dense_values2feature_list_dense_types"
Ncontext_sparseint ("
Ncontext_denseint ("!
Nfeature_list_sparseint (" 
Nfeature_list_denseint ("
context_sparse_types
list(type)
 "ćA list of Ncontext_sparse types; the data types of data in
each context Feature given in context_sparse_keys.
Currently the ParseSingleSequenceExample supports DT_FLOAT (FloatList),
DT_INT64 (Int64List), and DT_STRING (BytesList).(:
2	"+
Tcontext_dense
list(type)
 (:
2	"5
feature_list_dense_types
list(type)
 (:
2	"á
context_dense_shapeslist(shape)
 "ľA list of Ncontext_dense shapes; the shapes of data in
each context Feature given in context_dense_keys.
The number of elements in the Feature corresponding to context_dense_key[j]
must always equal context_dense_shapes[j].NumEntries().
The shape of context_dense_values[j] will match context_dense_shapes[j].("Ľ
feature_list_sparse_types
list(type)
 "ěA list of Nfeature_list_sparse types; the data types
of data in each FeatureList given in feature_list_sparse_keys.
Currently the ParseSingleSequenceExample supports DT_FLOAT (FloatList),
DT_INT64 (Int64List), and DT_STRING (BytesList).(:
2	"´
feature_list_dense_shapeslist(shape)
 "A list of Nfeature_list_dense shapes; the shapes of
data in each FeatureList given in feature_list_dense_keys.
The shape of each Feature in the FeatureList corresponding to
feature_list_dense_key[j] must always equal
feature_list_dense_shapes[j].NumEntries().(*PTransforms a scalar brain.SequenceExample proto (as strings) into typed tensors.
Ą
PlaceholderU
outputDA placeholder tensor that must be replaced using the feed mechanism."dtype"2
dtypetype"#The type of elements in the tensor."r
shapeshape: "^(Optional) The shape of the tensor. If the shape has 0 dimensions, the
shape is unconstrained.*CA placeholder op for a value that will be fed into the computation.2ÍN.B. This operation will fail with an error if it is executed. It is
intended as a way to represent a value that will always be fed, and to
provide attrs that enable the fed value to be checked at runtime.
ě
PlaceholderWithDefaultF
input6The default value to produce when `output` is not fed."dtypeP
output?A placeholder tensor that defaults to `input` if it is not fed."dtype"2
dtypetype"#The type of elements in the tensor.";
shapeshape"+The (possibly partial) shape of the tensor.*GA placeholder op that passes though `input` when its output is not fed.
×
Pow
x"T
y"T
z"T"
Ttype:	
2	*+Computes the power of one value to another.2ôGiven a tensor `x` and a tensor `y`, this operation computes \\(x^y\\) for
corresponding elements in `x` and `y`. For example:

```
# tensor 'x' is [[2, 2]], [3, 3]]
# tensor 'y' is [[8, 16], [2, 3]]
tf.pow(x, y) ==> [[256, 65536], [9, 27]]
```
ý
Print)
inputThe tensor passed to `output`"T?
data4A list of tensors to print out when op is evaluated.2U,
output= The unmodified `input` tensor"T"	
Ttype"
U
list(type)(0"=
messagestring "&A string, prefix of the error message."U
first_nint˙˙˙˙˙˙˙˙˙"8Only log `first_n` number of times. -1 disables logging."B
	summarizeint",Only print this many entries of each tensor.*Prints a list of tensors.2EPasses `input` through to `output` and prints `data` when evaluating.
Ą
Prod!
inputThe tensor to reduce."T0
reduction_indicesThe dimensions to reduce. 
outputThe reduced tensor."T"H
	keep_dimsbool( "1If true, retain reduced dimensions with length 1."
Ttype:
2	*?Computes the product of elements across dimensions of a tensor.2÷Reduces `input` along the dimensions given in `reduction_indices`. Unless
`keep_dims` is true, the rank of the tensor is reduced by 1 for each entry in
`reduction_indices`. If `keep_dims` is true, the reduced dimensions are
retained with length 1.
ź
PyFunc@
input2List of Tensors that will provide input to the Op.2Tin(
outputThe outputs from the Op.2Tout"Y
tokenstring"HA token representing a registered python function in this address space."8
Tin
list(type)"#Data types of the inputs to the op.("v
Tout
list(type)"^Data types of the outputs from the op.
The length of the list specifies the number of outputs.(0*9Invokes a python function to compute func(input)->output.


QueueClose%
handleThe handle to a queue."
cancel_pending_enqueuesbool( "\If true, all pending enqueue requests that are
blocked on the given queue will be cancelled.*Closes the given queue.2ľThis operation signals that no more elements will be enqueued in the
given queue. Subsequent Enqueue(Many) operations will fail.
Subsequent Dequeue(Many) operations will continue to succeed if
sufficient elements remain in the queue. Subsequent Dequeue(Many)
operations that would block will fail immediately.
Ů
QueueDequeue%
handleThe handle to a queue.Q

components2One or more tensors that were dequeued as a tuple.2component_types"I
component_types
list(type)"&The type of each component in a tuple.(0"

timeout_msint˙˙˙˙˙˙˙˙˙"{If the queue is empty, this operation will block for up to
timeout_ms milliseconds.
Note: This option is not supported yet.*=Dequeues a tuple of one or more tensors from the given queue.2ŚThis operation has k outputs, where k is the number of components
in the tuples stored in the given queue, and output i is the ith
component of the dequeued tuple.

N.B. If the queue is empty, this operation will block until an element
has been dequeued (or 'timeout_ms' elapses, if specified).
ć
QueueDequeueMany%
handleThe handle to a queue.'
n The number of tuples to dequeue.Q

components2One or more tensors that were dequeued as a tuple.2component_types"I
component_types
list(type)"&The type of each component in a tuple.(0"­

timeout_msint˙˙˙˙˙˙˙˙˙"If the queue has fewer than n elements, this operation
will block for up to timeout_ms milliseconds.
Note: This option is not supported yet.*>Dequeues n tuples of one or more tensors from the given queue.2óThis operation concatenates queue-element component tensors along the
0th dimension to make a single component tensor.  All of the components
in the dequeued tuple will have size n in the 0th dimension.

This operation has k outputs, where k is the number of components in
the tuples stored in the given queue, and output i is the ith
component of the dequeued tuple.

N.B. If the queue is empty, this operation will block until n elements
have been dequeued (or 'timeout_ms' elapses, if specified).

QueueEnqueue%
handleThe handle to a queue._

componentsDOne or more tensors from which the enqueued tensors should be taken.2Tcomponents"
Tcomponents
list(type)(0"

timeout_msint˙˙˙˙˙˙˙˙˙"zIf the queue is full, this operation will block for up to
timeout_ms milliseconds.
Note: This option is not supported yet.*;Enqueues a tuple of one or more tensors in the given queue.2őThe components input has k elements, which correspond to the components of
tuples stored in the given queue.

N.B. If the queue is full, this operation will block until the given
element has been enqueued (or 'timeout_ms' elapses, if specified).
Í
QueueEnqueueMany%
handleThe handle to a queue._

componentsDOne or more tensors from which the enqueued tensors should
be taken.2Tcomponents"
Tcomponents
list(type)(0"

timeout_msint˙˙˙˙˙˙˙˙˙"~If the queue is too full, this operation will block for up
to timeout_ms milliseconds.
Note: This option is not supported yet.*GEnqueues zero or more tuples of one or more tensors in the given queue.2§This operation slices each component tensor along the 0th dimension to
make multiple queue elements. All of the tuple components must have the
same size in the 0th dimension.

The components input has k elements, which correspond to the components of
tuples stored in the given queue.

N.B. If the queue is full, this operation will block until the given
elements have been enqueued (or 'timeout_ms' elapses, if specified).

	QueueSize%
handleThe handle to a queue.4
size*The number of elements in the given queue.*3Computes the number of elements in the given queue.
ž
RGBToHSVS
imagesG1-D or higher rank. RGB data to convert. Last dimension must be size 3.&
output`images` converted to HSV.*,Converts one or more images from RGB to HSV.2Outputs a tensor of the same shape as the `images` tensor, containing the HSV
value of the pixels. The output is only well defined if the value in `images`
are in `[0,1]`.

`output[..., 0]` contains hue, `output[..., 1]` contains saturation, and
`output[..., 2]` contains value. All HSV values are in `[0,1]`. A hue of 0
corresponds to pure red, hue 1/3 is pure green, and 2/3 is pure blue.


RandomCrop5
image)3-D of shape `[height, width, channels]`."TC
size91-D of length 2 containing: `crop_height`, `crop_width`..	@
output33-D of shape `[crop_height, crop_width, channels].`"T"
Ttype:
	2	"Ľ
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision.*Randomly crop `image`.2ˇ`size` is a 1-D int64 tensor with 2 elements representing the crop height and
width.  The values must be non negative.

This Op picks a random location in `image` and crops a `height` by `width`
rectangle from that location.  The random location is picked so the cropped
area will fit inside the original image.
Đ
RandomShuffle&
valueThe tensor to be shuffled."T\
outputOA tensor of same shape and type as `value`, shuffled along its first
dimension."T"Š
seedint "If either `seed` or `seed2` are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."8
seed2int "&A second seed to avoid seed collision."	
Ttype*5Randomly shuffles a tensor along its first dimension.2  The tensor is shuffled along dimension 0, such that each `value[j]` is mapped
  to one and only one `output[i]`. For example, a mapping that might occur for a
  3x2 tensor is:

```prettyprint
[[1, 2],       [[5, 6],
 [3, 4],  ==>   [1, 2],
 [5, 6]]        [3, 4]]
```
Ů	
RandomShuffleQueue'
handleThe handle to the queue."I
component_types
list(type)"&The type of each component in a value.(0"
shapeslist(shape)
 "The shape of each component in a value. The length of this attr must
be either 0 or the same as the length of component_types. If the length of
this attr is 0, the shapes of queue elements are not constrained, and
only one element may be dequeued at a time.("v
capacityint˙˙˙˙˙˙˙˙˙"XThe upper bound on the number of elements in this queue.
Negative numbers mean no limit."¸
min_after_dequeueint "Dequeue will block unless there would be this
many elements after the dequeue or the queue is closed. This
ensures a minimum level of mixing of elements."
seedint "If either seed or seed2 is set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, a random seed is used."8
seed2int "&A second seed to avoid seed collision."{
	containerstring "bIf non-empty, this queue is placed in the given container.
Otherwise, a default container is used."q
shared_namestring "VIf non-empty, this queue will be shared under the given name
across multiple sessions.*.A queue that randomizes the order of elements.
ˇ
RandomStandardNormal+
shapeThe shape of the output tensor."TR
outputAA tensor of the specified shape filled with random normal values."dtype"Š
seedint "If either `seed` or `seed2` are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."8
seed2int "&A second seed to avoid seed collision.".
dtypetype"The type of the output.:
2"
Ttype:
2	*1Outputs random values from a normal distribution.2?The generated values will have mean 0 and standard deviation 1.

RandomUniform+
shapeThe shape of the output tensor."TS
outputBA tensor of the specified shape filled with uniform random values."dtype"Š
seedint "If either `seed` or `seed2` are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."8
seed2int "&A second seed to avoid seed collision.".
dtypetype"The type of the output.:
2"
Ttype:
2	*2Outputs random values from a uniform distribution.2The generated values follow a uniform distribution in the range `[0, 1)`. The
lower bound 0 is included in the range, while the upper bound 1 is excluded.
ö
RandomUniformInt+
shapeThe shape of the output tensor."TF
minval60-D.  Inclusive lower bound on the generated integers."ToutF
maxval60-D.  Exclusive upper bound on the generated integers."ToutT
outputDA tensor of the specified shape filled with uniform random integers."Tout"Š
seedint "If either `seed` or `seed2` are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."8
seed2int "&A second seed to avoid seed collision."
Touttype:
2	"
Ttype:
2	*4Outputs random integers from a uniform distribution.2The generated values are uniform integers in the range `[minval, maxval)`.
The lower bound `minval` is included in the range, while the upper bound
`maxval` is excluded.

The random integers are slightly biased unless `maxval - minval` is an exact
power of two.  The bias is small for values of `maxval - minval` significantly
smaller than the range of the output (either `2^32` or `2^64`).

Range5
start*0-D (scalar). First entry in the sequence.<
limit10-D (scalar). Upper limit of sequence, exclusive.P
deltaE0-D (scalar). Optional. Default is 1. Number that increments `start`.
output1-D.*Creates a sequence of integers.2This operation creates a sequence of integers that begins at `start` and
extends by increments of `delta` up to but not including `limit`.

For example:

```
# 'start' is 3
# 'limit' is 18
# 'delta' is 3
tf.range(start, limit, delta) ==> [3, 6, 9, 12, 15]
```
˙
Rank

input"T

output"	
Ttype*Returns the rank of a tensor.2´This operation returns an integer representing the rank of `input`.

For example:

```prettyprint
# 't' is [[[1, 1, 1], [2, 2, 2]], [[3, 3, 3], [4, 4, 4]]]
# shape of tensor 't' is [2, 2, 3]
rank(t) ==> 3
```

**Note**: The rank of a tensor is not the same as the rank of a matrix. The rank
of a tensor is the number of indices required to uniquely select each element
of the tensor. Rank is also known as "order", "degree", or "ndims."
d
ReadFile
filename
contents*<Reads and outputs the entire contents of the input filename.
â
ReaderNumRecordsProduced)
reader_handleHandle to a Reader.
records_produced	*7Returns the number of records this Reader has produced.2LThis is the same as the number of ReaderRead executions that have
succeeded.
¤
ReaderNumWorkUnitsCompleted)
reader_handleHandle to a Reader.
units_completed	*EReturns the number of work units this Reader has finished processing.


ReaderRead)
reader_handleHandle to a Reader.?
queue_handle*Handle to a Queue, with string work items.
key	A scalar.
value	A scalar.*?Returns the next record (key, value pair) produced by a Reader.2Will dequeue from the input queue if necessary (e.g. when the
Reader needs to start reading from a new file since it has finished
with the previous file).
f
ReaderReset)
reader_handleHandle to a Reader.*,Restore a Reader to its initial clean state.

ReaderRestoreState)
reader_handleHandle to a Reader.Y
stateNResult of a ReaderSerializeState of a Reader with type
matching reader_handle.*-Restore a reader to a previously saved state.2SNot all Readers support being restored, so this can produce an
Unimplemented error.
ŕ
ReaderSerializeState)
reader_handleHandle to a Reader.	
state*;Produce a string tensor that encodes the state of a Reader.2UNot all Readers support being serialized, so this can produce an
Unimplemented error.
Ě
Real
in
out**Returns the real part of a complex number.2Given a tensor `in` of complex numbers, this operation returns a tensor of type
`float` that is the real part of each element in `in`. All elements in `in`
must be complex numbers of the form \\(a + bj\\), where *a* is the real part
returned by this operation and *b* is the imaginary part.

For example:

```
# tensor 'in' is [-2.25 + 4.75j, 3.25 + 5.75j]
tf.real(in) ==> [-2.25, 3.25]
```


ReduceJoinQ
inputsEThe input to be joined.  All reduced indices must have non-zero size.Š
reduction_indicesThe dimensions to reduce over.  Dimensions are reduced in the
order specified.  If `reduction_indices` has higher rank than `1`, it is
flattened.  Omitting `reduction_indices` is equivalent to passing
`[n-1, n-2, ..., 0]`.  Negative indices from `-n` to `-1` are supported.x
outputlHas shape equal to that of the input with reduced dimensions removed or
set to `1` depending on `keep_dims`."L
	keep_dimsbool( "5If `True`, retain reduced dimensions with length `1`.";
	separatorstring ""The separator to use when joining.*2Joins a string Tensor across the given dimensions.2żComputes the string join across dimensions in the given string Tensor of shape
`[d_0, d_1, ..., d_n-1]`.  Returns a new Tensor created by joining the input
strings with the given separator (default: empty string).  Negative indices are
counted backwards from the end, with `-1` being equivalent to `n - 1`.  Passing
an empty `reduction_indices` joins all strings in linear index order and outputs
a scalar string.


For example:
```
# tensor `a` is [["a", "b"], ["c", "d"]]
tf.reduce_join(a, 0) ==> ["ac", "bd"]
tf.reduce_join(a, 1) ==> ["ab", "cd"]
tf.reduce_join(a, -2) = tf.reduce_join(a, 0) ==> ["ac", "bd"]
tf.reduce_join(a, -1) = tf.reduce_join(a, 1) ==> ["ab", "cd"]
tf.reduce_join(a, 0, keep_dims=True) ==> [["ac", "bd"]]
tf.reduce_join(a, 1, keep_dims=True) ==> [["ab"], ["cd"]]
tf.reduce_join(a, 0, separator=".") ==> ["a.c", "b.d"]
tf.reduce_join(a, [0, 1]) ==> ["acbd"]
tf.reduce_join(a, [1, 0]) ==> ["abcd"]
tf.reduce_join(a, []) ==> ["abcd"]
```
ž
RefEnterA
data3The tensor to be made available to the child frame."T*
outputThe same tensor as `data`."T"	
Ttype"2

frame_namestring"The name of the child frame."P
is_constantbool( "7If true, the output is constant within the child frame."T
parallel_iterationsint
"4The number of iterations allowed to run in parallel.*NCreates or finds a child frame, and makes `data` available to the child frame.2The unique `frame_name` is used by the `Executor` to identify frames. If
`is_constant` is true, `output` is a constant in the child frame; otherwise
it may be changed in the child frame. At most `parallel_iterations` iterations
are run in parallel in the child frame.
î
RefExitB
data4The tensor to be made available to the parent frame."T*
outputThe same tensor as `data`."T"	
Ttype*,Exits the current frame to its parent frame.2:Exit makes its input `data` available to the parent frame.
l
RefIdentity
input"T
output"T"	
Ttype*3Return the same ref tensor as the input ref tensor.

RefMergeQ
inputs>The input tensors, exactly one of which will become available."T*N:
output*Will be set to the available input tensor."TB
value_index1The index of the chosen input tensor in `inputs`."	
Ttype"
Nint(0*DForwards the value of an available tensor from `inputs` to `output`.2Ă`Merge` waits for at least one of the tensors in `inputs` to become available.
It is usually combined with `Switch` to implement branching.

`Merge` forwards the first tensor for become available to `output`, and sets
`value_index` to its index in `inputs`.

It is an error if more than one tensor in `inputs` is available.
Á
RefNextIterationD
data6The tensor to be made available to the next iteration."T*
outputThe same tensor as `data`."T"	
Ttype*0Makes its input available to the next iteration.

	RefSelectA
index6A scalar that determines the input that gets selected.U
inputsBA list of ref tensors, one of which will be forwarded to `output`."T*N%
outputThe forwarded tensor."T"	
Ttype"
Nint(0*7Forwards the `index`th element of `inputs` to `output`.
Ł
	RefSwitchG
data9The ref tensor to be forwarded to the appropriate output."TF
pred<A scalar that specifies which output port will receive data.
P
output_false:If `pred` is false, data will be forwarded to this output."TN
output_true9If `pred` is true, data will be forwarded to this output."T"	
Ttype*GForwards the ref tensor `data` to the output port determined by `pred`.2If `pred` is true, the `data` input is forwarded to `output_true`. Otherwise,
the data goes to `output_false`.

See also `Switch` and `Merge`.
q
Relu
features"T
activations"T"
Ttype:
2		*.Computes rectified linear: `max(features, 0)`.
|
Relu6
features"T
activations"T"
Ttype:
2		*8Computes rectified linear 6: `min(max(features, 0), 6)`.
ä
	Relu6GradR
	gradientsBThe backpropagated gradients to the corresponding Relu6 operation."TQ
featuresBThe features passed as input to the corresponding Relu6 operation."TX
	backpropsHThe gradients:
`gradients * features * (features > 0) * (features < 6)`."T"
Ttype:
2		*<Computes rectified linear 6 gradients for a Relu6 operation.
ď
ReluGradQ
	gradientsAThe backpropagated gradients to the corresponding Relu operation."T
features|The features passed as input to the corresponding Relu operation, OR
the outputs of that operation (both work equivalently)."T-
	backprops`gradients * (features > 0)`."T"
Ttype:
2		*9Computes rectified linear gradients for a Relu operation.
ß
Reshape
tensor"T2
shape'Defines the shape of the output tensor.
output"T"	
Ttype*Reshapes a tensor.2ćGiven `tensor`, this operation returns a tensor that has the same values
as `tensor` with shape `shape`.

If one component of `shape` is the special value -1, the size of that dimension
is computed so that the total size remains constant.  In particular, a `shape`
of `[-1]` flattens into 1-D.  At most one component of `shape` can be -1.

If `shape` is 1-D or higher, then the operation returns a tensor with shape
`shape` filled with the values of `tensor`. In this case, the number of elements
implied by `shape` must be the same as the number of elements in `tensor`.

For example:

```prettyprint
# tensor 't' is [1, 2, 3, 4, 5, 6, 7, 8, 9]
# tensor 't' has shape [9]
reshape(t, [3, 3]) ==> [[1, 2, 3]
                        [4, 5, 6]
                        [7, 8, 9]]

# tensor 't' is [[[1, 1], [2, 2]]
#                [[3, 3], [4, 4]]]
# tensor 't' has shape [2, 2, 2]
reshape(t, [2, 4]) ==> [[1, 1, 2, 2]
                        [3, 3, 4, 4]]

# tensor 't' is [[[1, 1, 1],
#                 [2, 2, 2]],
#                [[3, 3, 3],
#                 [4, 4, 4]],
#                [[5, 5, 5],
#                 [6, 6, 6]]]
# tensor 't' has shape [3, 2, 3]
# pass '[-1]' to flatten 't'
reshape(t, [-1]) ==> [1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6]
# -1 can also be used with higher dimensional shapes
reshape(t, [2, -1]) ==> [[1, 1, 1, 2, 2, 2, 3, 3, 3],
                         [4, 4, 4, 5, 5, 5, 6, 6, 6]]

# tensor 't' is [7]
# shape `[]` reshapes to a scalar
reshape(t, []) ==> 7
```


ResizeArea?
images24-D with shape `[batch, height, width, channels]`."Td
sizeZ= A 1-D int32 Tensor of 2 elements: `new_height, new_width`.  The
new size for the images.N
resized_images:4-D with shape
`[batch, new_height, new_width, channels]`."
Ttype:
	2	"ć
align_cornersbool( "ĘIf true, rescale input by (new_height - 1) / (height - 1), which
exactly aligns the 4 corners of images and resized images. If false, rescale
by new_height / height. Treat similarly the width dimension.*3Resize `images` to `size` using area interpolation.2JInput images can be of different types but output images are always float.

ResizeBicubic?
images24-D with shape `[batch, height, width, channels]`."Td
sizeZ= A 1-D int32 Tensor of 2 elements: `new_height, new_width`.  The
new size for the images.N
resized_images:4-D with shape
`[batch, new_height, new_width, channels]`."
Ttype:
	2	"ć
align_cornersbool( "ĘIf true, rescale input by (new_height - 1) / (height - 1), which
exactly aligns the 4 corners of images and resized images. If false, rescale
by new_height / height. Treat similarly the width dimension.*6Resize `images` to `size` using bicubic interpolation.2JInput images can be of different types but output images are always float.

ResizeBilinear?
images24-D with shape `[batch, height, width, channels]`."Td
sizeZ= A 1-D int32 Tensor of 2 elements: `new_height, new_width`.  The
new size for the images.N
resized_images:4-D with shape
`[batch, new_height, new_width, channels]`."
Ttype:
	2	"ć
align_cornersbool( "ĘIf true, rescale input by (new_height - 1) / (height - 1), which
exactly aligns the 4 corners of images and resized images. If false, rescale
by new_height / height. Treat similarly the width dimension.*7Resize `images` to `size` using bilinear interpolation.2JInput images can be of different types but output images are always float.

ResizeBilinearGrad=
grads24-D with shape `[batch, height, width, channels]`.t
original_image_4-D with shape `[batch, orig_height, orig_width, channels]`,
The image tensor that was resized."TĄ
output4-D with shape `[batch, orig_height, orig_width, channels]`.
Gradients with respect to the input image. Input image must have been
float or double."T"
Ttype:
2"ç
align_cornersbool( "ËIf true, rescale grads by (orig_height - 1) / (height - 1), which
exactly aligns the 4 corners of grads and original_image. If false, rescale by
orig_height / height. Treat similarly the width dimension.*0Computes the gradient of bilinear interpolation.
Ń
ResizeNearestNeighbor?
images24-D with shape `[batch, height, width, channels]`."Td
sizeZ= A 1-D int32 Tensor of 2 elements: `new_height, new_width`.  The
new size for the images.O
resized_images:4-D with shape
`[batch, new_height, new_width, channels]`."T"
Ttype:
	2	"ć
align_cornersbool( "ĘIf true, rescale input by (new_height - 1) / (height - 1), which
exactly aligns the 4 corners of images and resized images. If false, rescale
by new_height / height. Treat similarly the width dimension.*?Resize `images` to `size` using nearest neighbor interpolation.
î
ResizeNearestNeighborGrad>
grads24-D with shape `[batch, height, width, channels]`."Ta
sizeW= A 1-D int32 Tensor of 2 elements: `orig_height, orig_width`. The
original input size.t
outputg4-D with shape `[batch, orig_height, orig_width, channels]`. Gradients
with respect to the input image."T"
Ttype:	
2"ç
align_cornersbool( "ËIf true, rescale grads by (orig_height - 1) / (height - 1), which
exactly aligns the 4 corners of grads and original_image. If false, rescale by
orig_height / height. Treat similarly the width dimension.*8Computes the gradient of nearest neighbor interpolation.
Š

Restoree
file_patternSMust have a single element. The pattern of the files from
which we read the tensor.S
tensor_nameBMust have a single element. The name of the tensor to be
restored."
tensorThe restored tensor."dt"2
dttype"&The type of the tensor to be restored."h
preferred_shardint˙˙˙˙˙˙˙˙˙"CIndex of file to open first if multiple files match
`file_pattern`.*(Restores a tensor from checkpoint files.2őReads a tensor stored in one or several files. If there are several files (for
instance because a tensor was saved as slices), `file_pattern` may contain
wildcard symbols (`*` and `?`) in the filename portion only, not in the
directory portion.

If a `file_pattern` matches several files, `preferred_shard` can be used to hint
in which file the requested tensor is likely to be found. This op will first
open the file at index `preferred_shard` in the list of matching files and try
to restore tensors from that file.  Only if some tensors or tensor slices are
not found in that first file, then the Op opens all the files. Setting
`preferred_shard` to match the value passed as the `shard` input
of a matching `Save` Op may speed up Restore.  This attribute only affects
performance, not correctness.  The default value -1 means files are processed in
order.

See also `RestoreSlice`.

RestoreSlicee
file_patternSMust have a single element. The pattern of the files from
which we read the tensor.S
tensor_nameBMust have a single element. The name of the tensor to be
restored.a
shape_and_sliceLScalar. The shapes and slice specifications to use when
restoring a tensors."
tensorThe restored tensor."dt"2
dttype"&The type of the tensor to be restored."
preferred_shardint˙˙˙˙˙˙˙˙˙"hIndex of file to open first if multiple files match
`file_pattern`. See the documentation for `Restore`.*(Restores a tensor from checkpoint files.2ŃThis is like `Restore` except that restored tensor can be listed as filling
only a slice of a larger tensor.  `shape_and_slice` specifies the shape of the
larger tensor and the slice that the restored tensor covers.

The `shape_and_slice` input has the same format as the
elements of the `shapes_and_slices` input of the `SaveSlices` op.

Reverse
tensor
Up to 8-D."T)
dims1-D. The dimensions to reverse.
(
outputThe same shape as `tensor`."T"
Ttype:

2
*)Reverses specific dimensions of a tensor.2ŰGiven a `tensor`, and a `bool` tensor `dims` representing the dimensions
of `tensor`, this operation reverses each dimension i of `tensor` where
`dims[i]` is `True`.

`tensor` can have up to 8 dimensions. The number of dimensions
of `tensor` must equal the number of elements in `dims`. In other words:

`rank(tensor) = size(dims)`

For example:

```prettyprint
# tensor 't' is [[[[ 0,  1,  2,  3],
#                  [ 4,  5,  6,  7],
#                  [ 8,  9, 10, 11]],
#                 [[12, 13, 14, 15],
#                  [16, 17, 18, 19],
#                  [20, 21, 22, 23]]]]
# tensor 't' shape is [1, 2, 3, 4]

# 'dims' is [False, False, False, True]
reverse(t, dims) ==> [[[[ 3,  2,  1,  0],
                        [ 7,  6,  5,  4],
                        [ 11, 10, 9, 8]],
                       [[15, 14, 13, 12],
                        [19, 18, 17, 16],
                        [23, 22, 21, 20]]]]

# 'dims' is [False, True, False, False]
reverse(t, dims) ==> [[[[12, 13, 14, 15],
                        [16, 17, 18, 19],
                        [20, 21, 22, 23]
                       [[ 0,  1,  2,  3],
                        [ 4,  5,  6,  7],
                        [ 8,  9, 10, 11]]]]

# 'dims' is [False, False, True, False]
reverse(t, dims) ==> [[[[8, 9, 10, 11],
                        [4, 5, 6, 7],
                        [0, 1, 2, 3]]
                       [[20, 21, 22, 23],
                        [16, 17, 18, 19],
                        [12, 13, 14, 15]]]]
```

ReverseSequence!
inputThe input to reverse."Te
seq_lengthsT1-D with length `input.dims(batch_dim)` and
`max(seq_lengths) < input.dims(seq_dim)`	L
output?The partially reversed input. It has the same shape as `input`."T":
seq_dimint"*The dimension which is partially reversed."F
	batch_dimint "0The dimension along which reversal is performed."	
Ttype* Reverses variable length slices.2This op first slices `input` along the dimension `batch_dim`, and for each
slice `i`, reverses the first `seq_lengths[i]` elements along
the dimension `seq_dim`.

The elements of `seq_lengths` must obey `seq_lengths[i] < input.dims[seq_dim]`,
and `seq_lengths` must be a vector of length `input.dims[batch_dim]`.

The output slice `i` along dimension `batch_dim` is then given by input
slice `i`, with the first `seq_lengths[i]` slices along dimension
`seq_dim` reversed.

For example:

```prettyprint
# Given this:
batch_dim = 0
seq_dim = 1
input.dims = (4, 8, ...)
seq_lengths = [7, 2, 3, 5]

# then slices of input are reversed on seq_dim, but only up to seq_lengths:
output[0, 0:7, :, ...] = input[0, 7:0:-1, :, ...]
output[1, 0:2, :, ...] = input[1, 2:0:-1, :, ...]
output[2, 0:3, :, ...] = input[2, 3:0:-1, :, ...]
output[3, 0:5, :, ...] = input[3, 5:0:-1, :, ...]

# while entries past seq_lens are copied through:
output[0, 7:, :, ...] = input[0, 7:, :, ...]
output[1, 2:, :, ...] = input[1, 2:, :, ...]
output[2, 3:, :, ...] = input[2, 3:, :, ...]
output[3, 2:, :, ...] = input[3, 2:, :, ...]
```

In contrast, if:

```prettyprint
# Given this:
batch_dim = 2
seq_dim = 0
input.dims = (8, ?, 4, ...)
seq_lengths = [7, 2, 3, 5]

# then slices of input are reversed on seq_dim, but only up to seq_lengths:
output[0:7, :, 0, :, ...] = input[7:0:-1, :, 0, :, ...]
output[0:2, :, 1, :, ...] = input[2:0:-1, :, 1, :, ...]
output[0:3, :, 2, :, ...] = input[3:0:-1, :, 2, :, ...]
output[0:5, :, 3, :, ...] = input[5:0:-1, :, 3, :, ...]

# while entries past seq_lens are copied through:
output[7:, :, 0, :, ...] = input[7:, :, 0, :, ...]
output[2:, :, 1, :, ...] = input[2:, :, 1, :, ...]
output[3:, :, 2, :, ...] = input[3:, :, 2, :, ...]
output[2:, :, 3, :, ...] = input[2:, :, 3, :, ...]
```

Rsqrt
x"T
y"T"
Ttype:	
2	*5Computes reciprocal of square root of x element-wise.2I.e., \\(y = 1 / \sqrt{x}\\).
×
SampleDistortedBoundingBox=

image_size,1-D, containing `[height, width, channels]`."Tm
bounding_boxesY3-D with shape `[batch, N, 4]` describing the N bounding boxes
associated with the image._
beginS1-D, containing `[offset_height, offset_width, 0]`. Provide as input to
`tf.slice`."T_
sizeT1-D, containing `[target_height, target_width, -1]`. Provide as input to
`tf.slice`."T
bboxesu3-D with shape `[1, 1, 4]` containing the distorted bounding box.
Provide as input to `tf.image.draw_bounding_boxes`."
Ttype:	
2	"¨
seedint "If either `seed` or `seed2` are set to non-zero, the random number
generator is seeded by the given `seed`.  Otherwise, it is seeded by a random
seed."8
seed2int "&A second seed to avoid seed collision."
min_object_coveredfloat%ÍĚĚ="_The cropped area of the image must contain at least this
fraction of any bounding box supplied."
aspect_ratio_rangelist(float)

"  @?q=Ş?"[The cropped area of the image must have an aspect ratio =
width / height within this range."

area_rangelist(float)

"ÍĚL=  ?"aThe cropped area of the image must contain a fraction of the
supplied image within in this range."Ž
max_attemptsintd"Number of attempts at generating a cropped region of the image
of the specified constraints. After `max_attempts` failures, return the entire
image."ş
use_image_if_no_bounding_boxesbool( "Controls behavior if no bounding boxes supplied.
If true, assume an implicit bounding box covering the whole input. If false,
raise an error.*?Generate a single randomly distorted bounding box for an image.2őBounding box annotations are often supplied in addition to ground-truth labels
in image recognition or object localization tasks. A common technique for
training such a system is to randomly distort an image while preserving
its content, i.e. *data augmentation*. This Op outputs a randomly distorted
localization of an object, i.e. bounding box, given an `image_size`,
`bounding_boxes` and a series of constraints.

The output of this Op is a single bounding box that may be used to crop the
original image. The output is returned as 3 tensors: `begin`, `size` and
`bboxes`. The first 2 tensors can be fed directly into `tf.slice` to crop the
image. The latter may be supplied to `tf.image.draw_bounding_box` to visualize
what the bounding box looks like.

Bounding boxes are supplied and returned as `[y_min, x_min, y_max, x_max]`. The
bounding box coordinates are floats in `[0.0, 1.0]` relative to the width and
height of the underlying image.

For example,

    # Generate a single distorted bounding box.
    begin, size, bbox_for_draw = tf.image.sample_distorted_bounding_box(
        tf.shape(image),
        bounding_boxes=bounding_boxes)

    # Draw the bounding box in an image summary.
    image_with_box = tf.image.draw_bounding_boxes(tf.expand_dims(image, 0),
                                                  bbox_for_draw)
    tf.image_summary('images_with_box', image_with_box)

    # Employ the bounding box to distort the image.
    distorted_image = tf.slice(image, begin, size)

Note that if no bounding box information is available, setting
`use_image_if_no_bounding_boxes = true` will assume there is a single implicit
bounding box covering the whole image. If `use_image_if_no_bounding_boxes` is
false and no bounding boxes are supplied, an error is raised.
Ł
Save\
filenameNMust have a single element. The name of the file to which we write
the tensor.D
tensor_names2Shape `[N]`. The names of the tensors to be saved.
data`N` tensors to save.2T"
T
list(type)(0* Saves the input tensors to disk.2The size of `tensor_names` must match the number of tensors in `data`. `data[i]`
is written to `filename` with name `tensor_names[i]`.

See also `SaveSlices`.
§


SaveSlices\
filenameNMust have a single element. The name of the file to which we write the
tensor.D
tensor_names2Shape `[N]`. The names of the tensors to be saved.h
shapes_and_slicesQShape `[N]`.  The shapes and slice specifications to use when
saving the tensors.
data`N` tensors to save.2T"
T
list(type)(0*#Saves input tensors slices to disk.2ŻThis is like `Save` except that tensors can be listed in the saved file as being
a slice of a larger tensor.  `shapes_and_slices` specifies the shape of the
larger tensor and the slice that this tensor covers. `shapes_and_slices` must
have as many elements as `tensor_names`.

Elements of the `shapes_and_slices` input must either be:

*  The empty string, in which case the corresponding tensor is
   saved normally.
*  A string of the form `dim0 dim1 ... dimN-1 slice-spec` where the
   `dimI` are the dimensions of the larger tensor and `slice-spec`
   specifies what part is covered by the tensor to save.

`slice-spec` itself is a `:`-separated list: `slice0:slice1:...:sliceN-1`
where each `sliceI` is either:

*  The string `-` meaning that the slice covers all indices of this dimension
*  `start,length` where `start` and `length` are integers.  In that
   case the slice covers `length` indices starting at `start`.

See also `Save`.

ScalarSummary
tagsTags for the summary.:
values-Same shape as `tags.  Values for the summary."T;
summary.Scalar.  Serialized `Summary` protocol buffer."
Ttype:
2		*7Outputs a `Summary` protocol buffer with scalar values.2The input `tags` and `values` must have the same shape.  The generated summary
has a summary value for each tag-value pair in `tags` and `values`.
Ł


ScatterAdd.
ref!Should be from a `Variable` node."TK
indices6A tensor of indices into the first dimension of `ref`."Tindices9
updates+A tensor of updated values to add to `ref`."T

output_refx= Same as `ref`.  Returned as a convenience for operations that want
to use the updated values after the update is done."T"
Ttype:
2	"
Tindicestype:
2	"
use_lockingbool( "xIf True, the addition will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*,Adds sparse updates to a variable reference.2ŇThis operation computes

    # Scalar indices
    ref[indices, ...] += updates[...]

    # Vector indices (for each i)
    ref[indices[i], ...] += updates[i, ...]

    # High rank indices (for each i, ..., j)
    ref[indices[i, ..., j], ...] += updates[i, ..., j, ...]

This operation outputs `ref` after the update is done.
This makes it easier to chain operations that need to use the reset value.

Duplicate entries are handled correctly: if multiple `indices` reference
the same location, their contributions add.

Requires `updates.shape = indices.shape + ref.shape[1:]`.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/ScatterAdd.png" alt>
</div>
Ł


ScatterSub.
ref!Should be from a `Variable` node."TK
indices6A tensor of indices into the first dimension of `ref`."Tindices@
updates2A tensor of updated values to subtract from `ref`."T

output_refx= Same as `ref`.  Returned as a convenience for operations that want
to use the updated values after the update is done."T"
Ttype:
2	"
Tindicestype:
2	"
use_lockingbool( "{If True, the subtraction will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*1Subtracts sparse updates to a variable reference.2Ă    # Scalar indices
    ref[indices, ...] -= updates[...]

    # Vector indices (for each i)
    ref[indices[i], ...] -= updates[i, ...]

    # High rank indices (for each i, ..., j)
    ref[indices[i, ..., j], ...] -= updates[i, ..., j, ...]

This operation outputs `ref` after the update is done.
This makes it easier to chain operations that need to use the reset value.

Duplicate entries are handled correctly: if multiple `indices` reference
the same location, their (negated) contributions add.

Requires `updates.shape = indices.shape + ref.shape[1:]`.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/ScatterSub.png" alt>
</div>
Í

ScatterUpdate.
ref!Should be from a `Variable` node."TK
indices6A tensor of indices into the first dimension of `ref`."Tindices;
updates-A tensor of updated values to store in `ref`."T

output_refx= Same as `ref`.  Returned as a convenience for operations that want
to use the updated values after the update is done."T"	
Ttype"
Tindicestype:
2	"
use_lockingbool("zIf True, the assignment will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*/Applies sparse updates to a variable reference.2This operation computes

    # Scalar indices
    ref[indices, ...] = updates[...]

    # Vector indices (for each i)
    ref[indices[i], ...] = updates[i, ...]

    # High rank indices (for each i, ..., j)
    ref[indices[i, ..., j], ...] = updates[i, ..., j, ...]

This operation outputs `ref` after the update is done.
This makes it easier to chain operations that need to use the reset value.

If values in `ref` is to be updated more than once, because there are
duplicate entires in `indices`, the order at which the updates happen
for each value is undefined.

Requires `updates.shape = indices.shape + ref.shape[1:]`.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/ScatterUpdate.png" alt>
</div>
ö

SegmentMax	
data"T
segment_idswA 1-D tensor whose rank is equal to the rank of `data`'s
first dimension.  Values should be sorted and can be repeated."Tindicesg
outputZHas same shape as data, except for dimension 0 which
has size `k`, the number of segments."T"
Ttype:
2		"
Tindicestype:
2	*0Computes the maximum along segments of a tensor.2úRead [the section on Segmentation](../../api_docs/python/math_ops.md#segmentation)
for an explanation of segments.

Computes a tensor such that
\\(output_i = \max_j(data_j)\\) where `max` is over `j` such
that `segment_ids[j] == i`.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/SegmentMax.png" alt>
</div>
Ź
SegmentMean	
data"T
segment_idswA 1-D tensor whose rank is equal to the rank of `data`'s
first dimension.  Values should be sorted and can be repeated."Tindicesg
outputZHas same shape as data, except for dimension 0 which
has size `k`, the number of segments."T"
Ttype:
2		"
Tindicestype:
2	*-Computes the mean along segments of a tensor.2˛Read [the section on
Segmentation](../../api_docs/python/math_ops.md#segmentation) for an explanation
of segments.

Computes a tensor such that
\\(output_i = \frac{\sum_j data_j}{N}\\) where `mean` is
over `j` such that `segment_ids[j] == i` and `N` is the total number of
values summed.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/SegmentMean.png" alt>
</div>
ö

SegmentMin	
data"T
segment_idswA 1-D tensor whose rank is equal to the rank of `data`'s
first dimension.  Values should be sorted and can be repeated."Tindicesg
outputZHas same shape as data, except for dimension 0 which
has size `k`, the number of segments."T"
Ttype:
2		"
Tindicestype:
2	*0Computes the minimum along segments of a tensor.2úRead [the section on
Segmentation](../../api_docs/python/math_ops.md#segmentation) for an explanation
of segments.

Computes a tensor such that
\\(output_i = \min_j(data_j)\\) where `min` is over `j` such
that `segment_ids[j] == i`.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/SegmentMin.png" alt>
</div>
ţ
SegmentProd	
data"T
segment_idswA 1-D tensor whose rank is equal to the rank of `data`'s
first dimension.  Values should be sorted and can be repeated."Tindicesg
outputZHas same shape as data, except for dimension 0 which
has size `k`, the number of segments."T"
Ttype:
2		"
Tindicestype:
2	*0Computes the product along segments of a tensor.2Read [the section on
Segmentation](../../api_docs/python/math_ops.md#segmentation) for an explanation
of segments.

Computes a tensor such that
\\(output_i = \prod_j data_j\\) where the product is over `j` such
that `segment_ids[j] == i`.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/SegmentProd.png" alt>
</div>
ď

SegmentSum	
data"T
segment_idswA 1-D tensor whose rank is equal to the rank of `data`'s
first dimension.  Values should be sorted and can be repeated."Tindicesg
outputZHas same shape as data, except for dimension 0 which
has size `k`, the number of segments."T"
Ttype:
2		"
Tindicestype:
2	*,Computes the sum along segments of a tensor.2÷Read [the section on Segmentation](../../api_docs/python/math_ops.md#segmentation)
for an explanation of segments.

Computes a tensor such that
\\(output_i = \sum_j data_j\\) where sum is over `j` such
that `segment_ids[j] == i`.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/SegmentSum.png" alt>
</div>
ß
Select
	condition
ł
tŞ= A `Tensor` which may have the same shape as `condition`.
If `condition` is rank 1, `t` may have higher rank,
but its first dimension must match the size of `condition`."T9
e1= A `Tensor` with the same type and shape as `t`."TC
out9= A `Tensor` with the same type and shape as `t` and `e`."T"	
Ttype*;Selects elements from `t` or `e`, depending on `condition`.2Ç	The `t`, and `e` tensors must all have the same shape,
and the output will also have that shape.  The `condition` tensor
must be a scalar if `t` and `e` are scalars.  If `t` and `e` are vectors
or higher rank, then `condition` must be either a vector with size
matching the first dimension of `t`, or must have the same shape as `t`.

The `condition` tensor acts as a mask that chooses, based on the value at each
element, whether the corresponding element / row in the output should be
taken from `t` (if true) or `e` (if false).

If `condition` is a vector and `t` and `e` are higher rank matrices, then
it chooses which row (outer dimension) to copy from `t` and `e`.
If `condition` has the same shape as `t` and `e`, then it chooses which
element to copy from `t` and `e`.

For example:

```prettyprint
# 'condition' tensor is [[True,  False]
#                        [False, True]]
# 't' is [[1, 2],
#         [3, 4]]
# 'e' is [[5, 6],
#         [7, 8]]
select(condition, t, e) ==> [[1, 6],
                             [7, 4]]


# 'condition' tensor is [True, False]
# 't' is [[1, 2],
#         [3, 4]]
# 'e' is [[5, 6],
#         [7, 8]]
select(condition, t, e) ==> [[1, 2],
                             [7, 8]]

```

SelfAdjointEig
inputShape is `[M, M]`."T!
outputShape is `[M+1, M]`."T"
Ttype:
2*CCalculates the Eigen Decomposition of a square Self-Adjoint matrix.2ÜOnly the lower-triangular part of the input will be used in this case. The
upper-triangular part will not be read.

The result is a M+1 x M matrix whose first row is the eigenvalues, and
subsequent rows are eigenvectors.
Ő
SerializeManySparseH
sparse_indices42-D.  The `indices` of the minibatch `SparseTensor`.	G
sparse_values31-D.  The `values` of the minibatch `SparseTensor`."TD
sparse_shape21-D.  The `shape` of the minibatch `SparseTensor`.	
serialized_sparse"	
Ttype*KSerialize an `N`-minibatch `SparseTensor` into an `[N, 3]` string `Tensor`.2őThe `SparseTensor` must have rank `R` greater than 1, and the first dimension
is treated as the minibatch dimension.  Elements of the `SparseTensor`
must be sorted in increasing order of this first dimension.  The serialized
`SparseTensor` objects going into each row of `serialized_sparse` will have
rank `R-1`.

The minibatch size `N` is extracted from `sparse_shape[0]`.
¸
SerializeSparse>
sparse_indices*2-D.  The `indices` of the `SparseTensor`.	=
sparse_values)1-D.  The `values` of the `SparseTensor`."T:
sparse_shape(1-D.  The `shape` of the `SparseTensor`.	
serialized_sparse"	
Ttype*HSerialize a `SparseTensor` into a string 3-vector (1-D `Tensor`) object.

Shape

input"T

output"	
Ttype*Returns the shape of a tensor.2ÁThis operation returns a 1-D integer tensor representing the shape of `input`.

For example:

```prettyprint
# 't' is [[[1, 1, 1], [2, 2, 2]], [[3, 3, 3], [4, 4, 4]]]
shape(t) ==> [2, 2, 3]
```
Ť
ShapeN
input"T*N
output*N"
Nint(0"	
Ttype*Returns shape of tensors.2OThis operation returns N 1-D integer tensors representing shape of `input[i]s`.
ź
ShardedFilename
basename	
shard

num_shards
filename*@Generate a sharded filename. The filename is printf formatted as20   %s-%05d-of-%05d, basename, shard, num_shards.
w
ShardedFilespec
basename

num_shards
filename*8Generate a glob pattern matching all sharded file names.
~
Sigmoid
x"T
y"T"
Ttype:	
2	*%Computes sigmoid of `x` element-wise.2&Specifically, `y = 1 / (1 + exp(-x))`.
ő
Sign
x"T
y"T"
Ttype:	
2	*;Returns an element-wise indication of the sign of a number.2`y = sign(x) = -1` if `x < 0`; 0 if `x == 0`; 1 if `x > 0`.

For complex numbers, `y = sign(x) = x / |x|` if `x != 0`, otherwise `y = 0`.
L
Sin
x"T
y"T"
Ttype:	
2	*Computes sin of x element-wise.

Size

input"T

output"	
Ttype*Returns the size of a tensor.2žThis operation returns an integer representing the number of elements in
`input`.

For example:

```prettyprint
# 't' is [[[1, 1,, 1], [2, 2, 2]], [[3, 3, 3], [4, 4, 4]]]]
size(t) ==> 12
```
ü
Skipgram0

vocab_word A vector of words in the corpus.H

vocab_freq8Frequencies of words. Sorted in the non-ascending order.@
words_per_epoch+Number of words per epoch in the data file.	,
current_epochThe current epoch number.F
total_words_processed+The total number of words processed so far.	#
examplesA vector of word ids.!
labelsA vector of word ids."0
filenamestring"The corpus's text file name.".

batch_sizeint"The size of produced batch."[
window_sizeint"CThe number of words to predict to the left and right of the target."e
	min_countint"OThe minimum number of word occurrences for it to be included in the
vocabulary."
	subsamplefloat%o:"zThreshold for word occurrence. Words that appear with higher
frequency will be randomly down-sampled. Set to 0 to disable.*3Parses a text file and creates a batch of examples.
Ś
Slice

input"T`
beginPbegin[i] specifies the offset into the 'i'th dimension of
'input' to slice from."Index
sizeósize[i] specifies the number of elements of the 'i'th dimension
of 'input' to slice. If size[i] is -1, all remaining elements in dimension
i are included in the slice (i.e. this is equivalent to setting
size[i] = input.dim_size(i) - begin[i])."Index
output"T"	
Ttype"
Indextype:
2	*Return a slice from 'input'.2ŰThe output tensor is a tensor with dimensions described by 'size'
whose values are extracted from 'input' starting at the offsets in
'begin'.

*Requirements*:
  0 <= begin[i] <= begin[i] + size[i] <= Di  for i in [0, n)

Softmax8
logits+2-D with shape `[batch_size, num_classes]`."T%
softmaxSame shape as `logits`."T"
Ttype:
2*Computes softmax activations.2eFor each batch `i` and class `j` we have

    softmax[i, j] = exp(logits[i, j]) / sum(exp(logits[i]))
Ý
SoftmaxCrossEntropyWithLogits.
featuresbatch_size x num_classes matrix"T
labels}batch_size x num_classes matrix
The caller must ensure that each batch of labels represents a valid
probability distribution."T0
loss%Per example loss (batch_size vector)."TJ
backprop;backpropagated gradients (batch_size x num_classes matrix)."T"
Ttype:
2*CComputes softmax cross entropy cost and gradients to backpropagate.2)Inputs are the logits, not probabilities.
s
Softplus
features"T
activations"T"
Ttype:
2		*,Computes softplus: `log(exp(features) + 1)`.
Đ
SoftplusGradU
	gradientsEThe backpropagated gradients to the corresponding softplus operation."TT
featuresEThe features passed as input to the corresponding softplus operation."TB
	backprops2The gradients: `gradients / (1 + exp(-features))`."T"
Ttype:
2		*5Computes softplus gradients for a softplus operation.
{
Softsign
features"T
activations"T"
Ttype:
2		*4Computes softsign: `features / (abs(features) + 1)`.
Ő
SoftsignGradU
	gradientsEThe backpropagated gradients to the corresponding softsign operation."TT
featuresEThe features passed as input to the corresponding softsign operation."TG
	backprops7The gradients: `gradients / (1 + abs(-features)) ** 2`."T"
Ttype:
2		*5Computes softsign gradients for a softsign operation.

SpaceToDepth

input"T
output"T"	
Ttype"1

block_sizeint"The size of the spatial block.*#SpaceToDepth for tensors of type T.2ţRearranges blocks of spatial data, into depth. More specifically,
this op outputs a copy of the input tensor where values from the `height`
and `width` dimensions are moved to the `depth` dimension.
The attr `block_size` indicates the input block size and how the data is moved.

  * Non-overlapping blocks of size `block_size x block size` are rearranged
    into depth at each location.
  * The depth of the output tensor is `input_depth * block_size * block_size`.
  * The input tensor's height and width must be divisible by block_size.

That is, assuming the input is in the shape:
`[batch, height, width, depth]`,
the shape of the output will be:
`[batch, height/block_size, width/block_size, depth*block_size*block_size]`

This operation requires that the input tensor be of rank 4, and that
`block_size` be >=1 and a divisor of both the input `height` and `width`.

This operation is useful for resizing the activations between convolutions
(but keeping all data), e.g. instead of pooling. It is also useful for training
purely convolutional models.

For example, given this input of shape `[1, 2, 2, 1]`, and block_size of 2:

```prettyprint
x = [[[[1], [2]],
      [[3], [4]]]]
```

This operation will output a tensor of shape `[1, 1, 1, 4]`:

```prettyprint
[[[[1, 2, 3, 4]]]]
```

Here, the input has a batch of 1 and each batch element has shape `[2, 2, 1]`,
the corresponding output will have a single element (i.e. width and height are
both 1) and will have a depth of 4 channels (1 * block_size * block_size).
The output element shape is `[1, 1, 4]`.

For an input tensor with larger depth, here of shape `[1, 2, 2, 3]`, e.g.

```prettyprint
x = [[[[1, 2, 3], [4, 5, 6]],
      [[7, 8, 9], [10, 11, 12]]]]
```

This operation, for block_size of 2, will return the following tensor of shape
`[1, 1, 1, 12]`

```prettyprint
[[[[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]]]]
```

Similarly, for the following input of shape `[1 4 4 1]`, and a block size of 2:

```prettyprint
x = [[ [1],   [2],  [5],  [6]],
     [ [3],   [4],  [7],  [8]],
     [ [9],  [10], [13],  [14]],
     [ [11], [12], [15],  [16]]]
```

the operator will return the following tensor of shape `[1 2 2 4]`:

```prettyprint
x = [[[[1, 2, 3, 4],
       [5, 6, 7, 8]],
      [[9, 10, 11, 12],
       [13, 14, 15, 16]]]]
```
´
	SparseAdd[
	a_indicesL2-D.  The `indices` of the first `SparseTensor`, size `[nnz, ndims]` Matrix.	S
a_valuesD1-D.  The `values` of the first `SparseTensor`, size `[nnz]` Vector."TR
a_shapeE1-D.  The `shape` of the first `SparseTensor`, size `[ndims]` Vector.	\
	b_indicesM2-D.  The `indices` of the second `SparseTensor`, size `[nnz, ndims]` Matrix.	T
b_valuesE1-D.  The `values` of the second `SparseTensor`, size `[nnz]` Vector."TS
b_shapeF1-D.  The `shape` of the second `SparseTensor`, size `[ndims]` Vector.	i
threshX0-D.  The magnitude threshold that determines if an output value/index
pair takes space."Treal
sum_indices	

sum_values"T
	sum_shape	"
Ttype:
2	"
Trealtype:
2		*BAdds two `SparseTensor` objects to produce another `SparseTensor`.2úThe input `SparseTensor` objects' indices are assumed ordered in standard
lexicographic order.  If this is not the case, before this step run
`SparseReorder` to restore index ordering.

By default, if two values sum to zero at some index, the output `SparseTensor`
would still include that particular location in its index, storing a zero in the
corresponding value slot.  To override this, callers can specify `thresh`,
indicating that if the sum has a magnitude strictly smaller than `thresh`, its
corresponding value and index would then not be included.  In particular,
`thresh == 0` (default) means everything is kept and actual thresholding happens
only for a positive value.

In the following shapes, `nnz` is the count after taking `thresh` into account.

SparseAddGrads
backprop_val_grad[1-D with shape `[nnz(sum)]`.  The gradient with respect to
the non-empty values of the sum."TS
	a_indicesD2-D.  The `indices` of the `SparseTensor` A, size `[nnz(A), ndims]`.	S
	b_indicesD2-D.  The `indices` of the `SparseTensor` B, size `[nnz(B), ndims]`.	Y
sum_indicesH2-D.  The `indices` of the sum `SparseTensor`, size
`[nnz(sum), ndims]`.	c

a_val_gradR1-D with shape `[nnz(A)]`. The gradient with respect to the
non-empty values of A."Tc

b_val_gradR1-D with shape `[nnz(B)]`. The gradient with respect to the
non-empty values of B."T"
Ttype:
2	*+The gradient operator for the SparseAdd op.2÷The SparseAdd op calculates A + B, where A, B, and the sum are all represented
as `SparseTensor` objects.  This op takes in the upstream gradient w.r.t.
non-empty values of the sum, and outputs the gradients w.r.t. the non-empty
values of A and B.

SparseApplyAdadelta
var"T
accum"T
accum_update"T
lr"T
rho"T
epsilon"T	
grad"T
indices"Tindices
out"T"
Ttype:
2	"
Tindicestype:
2	"
use_lockingbool( *!var: Should be from a Variable().
ŕ
SparseApplyAdagrad)
varShould be from a Variable()."T+
accumShould be from a Variable()."T)
lr Learning rate. Must be a scalar."T
gradThe gradient."TS
indices>A vector of indices into the first dimension of var and accum."Tindices
outSame as "var"."T"
Ttype:
2	"
Tindicestype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*OUpdate relevant entries in '*var' and '*accum' according to the adagrad scheme.2That is for rows we have grad for, we update var and accum as follows:
accum += grad * grad
var -= lr * grad * (1 / sqrt(accum))
×
SparseApplyFtrl)
varShould be from a Variable()."T+
accumShould be from a Variable()."T,
linearShould be from a Variable()."T
gradThe gradient."TS
indices>A vector of indices into the first dimension of var and accum."Tindices*
lr!Scaling factor. Must be a scalar."T*
l1!Scaling factor. Must be a scalar."T*
l2!Scaling factor. Must be a scalar."T0
lr_power!Scaling factor. Must be a scalar."T
outSame as "var"."T"
Ttype:
2	"
Tindicestype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*HUpdate relevant entries in '*var' according to the Ftrl-proximal scheme.2ČThat is for rows we have grad for, we update var, accum and linear as follows:
accum_new = accum + grad * grad
linear += grad + (accum_new^(-lr_power) - accum^(-lr_power)) / lr * var
quadratic = 1.0 / (accum_new^(lr_power) * lr) + 2 * l2
var = (sign(linear) * l1 - linear) / quadratic if |linear| > l1 else 0.0
accum = accum_new

SparseApplyMomentum)
varShould be from a Variable()."T+
accumShould be from a Variable()."T)
lr Learning rate. Must be a scalar."T
gradThe gradient."TS
indices>A vector of indices into the first dimension of var and accum."Tindices*
momentumMomentum. Must be a scalar."T
outSame as "var"."T"
Ttype:
2	"
Tindicestype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*PUpdate relevant entries in '*var' and '*accum' according to the momentum scheme.2yThat is for rows we have grad for, we update var and accum as follows:

accum = accum * momentum + grad
var -= lr * accum

SparseConcat;
indices+2-D.  Indices of each input `SparseTensor`.	*N>
values.1-D.  Non-empty values of each `SparseTensor`."T*N3
shapes$1-D.  Shapes of each `SparseTensor`.	*NE
output_indices12-D.  Indices of the concatenated `SparseTensor`.	N
output_values:1-D.  Non-empty values of the concatenated `SparseTensor`."TA
output_shape/1-D.  Shape of the concatenated `SparseTensor`.	"4

concat_dimint"Dimension to concatenate along.("
Nint(0"	
Ttype*DConcatenates a list of `SparseTensor` along the specified dimension.2á	Concatenation is with respect to the dense versions of these sparse tensors.
It is assumed that each input is a `SparseTensor` whose elements are ordered
along increasing dimension number.

All inputs' shapes must match, except for the concat dimension.  The
`indices`, `values`, and `shapes` lists must have the same length.

The output shape is identical to the inputs', except along the concat
dimension, where it is the sum of the inputs' sizes along that dimension.

The output elements will be resorted to preserve the sort order along
increasing dimension number.

This op runs in `O(M log M)` time, where `M` is the total number of non-empty
values across all inputs. This is due to the need for an internal sort in
order to concatenate efficiently across an arbitrary dimension.

For example, if `concat_dim = 1` and the inputs are

    sp_inputs[0]: shape = [2, 3]
    [0, 2]: "a"
    [1, 0]: "b"
    [1, 1]: "c"

    sp_inputs[1]: shape = [2, 4]
    [0, 1]: "d"
    [0, 2]: "e"

then the output will be

    shape = [2, 7]
    [0, 2]: "a"
    [0, 4]: "d"
    [0, 5]: "e"
    [1, 0]: "b"
    [1, 1]: "c"

Graphically this is equivalent to doing

    [    a] concat [  d e  ] = [    a   d e  ]
    [b c  ]        [       ]   [b c          ]
é
SparseMatMul
a
b
product"
transpose_abool( "
transpose_bbool( "
a_is_sparsebool( "
b_is_sparsebool( *"Multiply matrix "a" by matrix "b".2ľThe inputs must be two-dimensional matrices and the inner dimension of "a" must
match the outer dimension of "b". This op is optimized for the case where at
least one of "a" or "b" is sparse. The breakeven for using this versus a dense
matrix multiply on one platform was 30% zero values in the sparse matrix.
ë
SparseReorder
input_indicesp2-D.  `N x R` matrix with the indices of non-empty values in a
SparseTensor, possibly not in canonical ordering.	O
input_values<1-D.  `N` non-empty values corresponding to `input_indices`."T7
input_shape&1-D.  Shape of the input SparseTensor.	u
output_indicesa2-D.  `N x R` matrix with the same indices as input_indices, but
in canonical row-major ordering.	Q
output_values=1-D.  `N` non-empty values corresponding to `output_indices`."T"	
Ttype*?Reorders a SparseTensor into the canonical, row-major ordering.2łNote that by convention, all sparse ops preserve the canonical ordering along
increasing dimension number. The only time ordering can be violated is during
manual manipulation of the indices and values vectors to add entries.

Reordering does not affect the shape of the SparseTensor.

If the tensor has rank `R` and `N` non-empty values, `input_indices` has
shape `[N, R]`, input_values has length `N`, and input_shape has length `R`.
â
SparseSegmentMean	
data"T:
indices-A 1-D tensor. Has same rank as `segment_ids`.K
segment_ids:A 1-D tensor. Values should be sorted and can be repeated.g
outputZHas same shape as data, except for dimension 0 which
has size `k`, the number of segments."T"
Ttype:
2*4Computes the mean along sparse segments of a tensor.2Read [the section on
Segmentation](../../api_docs/python/math_ops.md#segmentation) for an explanation
of segments.

Like `SegmentMean`, but `segment_ids` can have rank less than `data`'s first
dimension, selecting a subset of dimension 0, specified by `indices`.
ä
SparseSegmentMeanGrad;
grad0gradient propagated to the SparseSegmentMean op."TF
indices9indices passed to the corresponding SparseSegmentMean op.N
segment_ids=segment_ids passed to the corresponding SparseSegmentMean op.F
output_dim05dimension 0 of "data" passed to SparseSegmentMean op.
output"T"
Ttype:
2*)Computes gradients for SparseSegmentMean.2cReturns tensor "output" with same shape as grad, except for dimension 0 whose
value is output_dim0.

SparseSegmentSqrtN	
data"T:
indices-A 1-D tensor. Has same rank as `segment_ids`.K
segment_ids:A 1-D tensor. Values should be sorted and can be repeated.g
outputZHas same shape as data, except for dimension 0 which
has size `k`, the number of segments."T"
Ttype:
2*LComputes the sum along sparse segments of a tensor divided by the sqrt of N.2N is the size of the segment being reduced.

Read [the section on
Segmentation](../../api_docs/python/math_ops.md#segmentation) for an explanation
of segments.
ę
SparseSegmentSqrtNGrad<
grad1gradient propagated to the SparseSegmentSqrtN op."TG
indices:indices passed to the corresponding SparseSegmentSqrtN op.O
segment_ids>segment_ids passed to the corresponding SparseSegmentSqrtN op.G
output_dim06dimension 0 of "data" passed to SparseSegmentSqrtN op.
output"T"
Ttype:
2**Computes gradients for SparseSegmentSqrtN.2cReturns tensor "output" with same shape as grad, except for dimension 0 whose
value is output_dim0.
	
SparseSegmentSum	
data"T:
indices-A 1-D tensor. Has same rank as `segment_ids`.K
segment_ids:A 1-D tensor. Values should be sorted and can be repeated.g
outputZHas same shape as data, except for dimension 0 which
has size `k`, the number of segments."T"
Ttype:
2		*3Computes the sum along sparse segments of a tensor.2śRead [the section on
Segmentation](../../api_docs/python/math_ops.md#segmentation) for an explanation
of segments.

Like `SegmentSum`, but `segment_ids` can have rank less than `data`'s first
dimension, selecting a subset of dimension 0, specified by `indices`.

For example:

```prettyprint
c = tf.constant([[1,2,3,4], [-1,-2,-3,-4], [5,6,7,8]])

# Select two rows, one segment.
tf.sparse_segment_sum(c, tf.constant([0, 1]), tf.constant([0, 0]))
  ==> [[0 0 0 0]]

# Select two rows, two segment.
tf.sparse_segment_sum(c, tf.constant([0, 1]), tf.constant([0, 1]))
  ==> [[ 1  2  3  4]
       [-1 -2 -3 -4]]

# Select all rows, two segments.
tf.sparse_segment_sum(c, tf.constant([0, 1, 2]), tf.constant([0, 0, 1]))
  ==> [[0 0 0 0]
       [5 6 7 8]]

# Which is equivalent to:
tf.segment_sum(c, tf.constant([0, 0, 1]))
```
É
#SparseSoftmaxCrossEntropyWithLogits.
featuresbatch_size x num_classes matrix"Tv
labelscbatch_size vector with values in [0, num_classes).
This is the label for the given minibatch entry."Tlabels0
loss%Per example loss (batch_size vector)."TJ
backprop;backpropagated gradients (batch_size x num_classes matrix)."T"
Ttype:
2"
Tlabelstype0	:
2	*CComputes softmax cross entropy cost and gradients to backpropagate.2Unlike `SoftmaxCrossEntropyWithLogits`, this operation does not accept
a matrix of label probabilities, but rather a single label per row
of features.  This label is considered to have probability 1.0 for the
given row.

Inputs are the logits, not probabilities.
×	
SparseSplitb
	split_dimS0-D.  The dimension along which to split.  Must be in the range
`[0, rank(shape))`.	D
indices72-D tensor represents the indices of the sparse tensor.	C
values61-D tensor represents the values of the sparse tensor."T
shape1-D. tensor represents the shape of the sparse tensor.
output indices: A list of 1-D tensors represents the indices of the output
sparse tensors.	
output_indices	*	num_splith
output_valuesIA list of 1-D tensors represents the values of the output sparse
tensors."T*	num_splite
output_shapeHA list of 1-D tensors represents the shape of the output sparse
tensors.	*	num_split"2
	num_splitint"The number of ways to split.(0"	
Ttype*DSplit a `SparseTensor` into `num_split` tensors along one dimension.2ĂIf the `shape[split_dim]` is not an integer multiple of `num_split`. Slices
`[0 : shape[split_dim] % num_split]` gets one extra dimension.
For example, if `split_dim = 1` and `num_split = 2` and the input is

    input_tensor = shape = [2, 7]
    [    a   d e  ]
    [b c          ]

Graphically the output tensors are:

    output_tensor[0] = shape = [2, 4]
    [    a  ]
    [b c    ]

    output_tensor[1] = shape = [2, 3]
    [ d e  ]
    [      ]
¨
SparseTensorDenseMatMulQ
	a_indicesB2-D.  The `indices` of the `SparseTensor`, size `[nnz, 2]` Matrix.	M
a_values>1-D.  The `values` of the `SparseTensor`, size `[nnz]` Vector."TH
a_shape;1-D.  The `shape` of the `SparseTensor`, size `[2]` Vector.	
b2-D.  A dense Matrix."T
product"T"	
Ttype"
	adjoint_abool( "xUse the adjoint of A in the matrix multiply.  If A is complex, this
is transpose(conj(A)).  Otherwise it's transpose(A)."
	adjoint_bbool( "xUse the adjoint of B in the matrix multiply.  If B is complex, this
is transpose(conj(B)).  Otherwise it's transpose(B).*:Multiply SparseTensor (of rank 2) "A" by dense matrix "B".2No validity checking is performed on the indices of A.  However, the following
input format is recommended for optimal behavior:

if adjoint_a == false:
  A should be sorted in lexicographically increasing order.  Use SparseReorder
  if you're not sure.
if adjoint_a == true:
  A should be sorted in order of increasing dimension 1 (i.e., "column major"
  order instead of "row major" order).
ľ
SparseToDense
sparse_indicesk0-D, 1-D, or 2-D.  `sparse_indices[i]` contains the complete
index where `sparse_values[i]` will be placed."TindicesA
output_shape'1-D.  Shape of the dense output tensor."Tindices
sparse_valuesp1-D.  Values corresponding to each row of `sparse_indices`,
or a scalar value to be used for all sparse indices."TV
default_valueBScalar value to set for indices not specified in
`sparse_indices`."T8
dense,Dense output tensor of shape `output_shape`."T"
validate_indicesbool("oIf true, indices are checked to make sure they are sorted in
lexicographic order and that there are no repeats."	
Ttype"
Tindicestype:
2	*5Converts a sparse representation into a dense tensor.2ŃBuilds an array `dense` with shape `output_shape` such that

```prettyprint
# If sparse_indices is scalar
dense[i] = (i == sparse_indices ? sparse_values : default_value)

# If sparse_indices is a vector, then for each i
dense[sparse_indices[i]] = sparse_values[i]

# If sparse_indices is an n by d matrix, then for each i in [0, n)
dense[sparse_indices[i][0], ..., sparse_indices[i][d-1]] = sparse_values[i]
```

All other values in `dense` are set to `default_value`.  If `sparse_values` is a
scalar, all sparse indices are set to this single value.

Indices should be sorted in lexicographic order, and indices must not
contain any repeats. If `validate_indices` is true, these properties
are checked during execution.
ô
Splitb
	split_dimS0-D.  The dimension along which to split.  Must be in the range
`[0, rank(value))`. 
valueThe tensor to split."T¸
outputThey are identically shaped tensors, whose shape matches that of `value`
except along `split_dim`, where their sizes are
`values.shape[split_dim] / num_split`."T*	num_split"`
	num_splitint"JThe number of ways to split.  Must evenly divide
`value.shape[split_dim]`.(0"	
Ttype*=Splits a tensor into `num_split` tensors along one dimension.
z
Sqrt
x"T
y"T"
Ttype:	
2	*'Computes square root of x element-wise.2#I.e., \\(y = \sqrt{x} = x^{1/2}\\).
p
Square
x"T
y"T"
Ttype:	
2	*"Computes square of x element-wise.2I.e., \\(y = x * x = x^2\\).
j
SquaredDifference
x"T
y"T
z"T"
Ttype:	
2	*$Returns (x - y)(x - y) element-wise.
ő
Squeeze#
inputThe `input` to squeeze."Ta
outputTContains the same data as `input`, but has one or more dimensions of
size 1 removed."T"	
Ttype"Ş
squeeze_dims	list(int)
 "If specified, only squeezes the dimensions listed. The dimension
index starts at 0. It is an error to squeeze a dimension that is not 1.(*8Removes dimensions of size 1 from the shape of a tensor.2ďGiven a tensor `input`, this operation returns a tensor of the same type with
all dimensions of size 1 removed. If you don't want to remove all size 1
dimensions, you can remove specific size 1 dimensions by specifying
`squeeze_dims`.

For example:

```prettyprint
# 't' is a tensor of shape [1, 2, 1, 3, 1, 1]
shape(squeeze(t)) ==> [2, 3]
```

Or, to remove specific size 1 dimensions:

```prettyprint
# 't' is a tensor of shape [1, 2, 1, 3, 1, 1]
shape(squeeze(t, [2, 4])) ==> [1, 2, 3, 1]
```
Ë
Stack'
handleThe handle to the stack."9
	elem_typetype"&The type of the elements on the stack."

stack_namestring "Overrides the name used for the temporary stack resource. Default
value is the name of the 'Stack' op (which is guaranteed unique).*:A stack that produces elements in first-in last-out order.
b

StackClose%
handleThe handle to a stack.*-Delete the stack from its resource container.
Ý
StackPop%
handleThe handle to a stack.G
elem4The tensor that is popped from the top of the stack."	elem_type"7
	elem_typetype"$The type of the elem that is popped.*(Pop the element at the top of the stack.

	StackPush%
handleThe handle to a stack.2
elem'The tensor to be pushed onto the stack."T1
output$The same tensor as the input 'elem'."T"	
Ttype">
swap_memorybool( "%Swap `elem` to CPU. Default to false.*Push an element onto the stack.
	
StopGradient

input"T
output"T"	
Ttype*Stops gradient computation.2śWhen executed in a graph, this op outputs its input tensor as-is.

When building ops to compute gradients, this op prevents the contribution of
its inputs to be taken into account.  Normally, the gradient generator adds ops
to a graph to compute the derivatives of a specified 'loss' by recursively
finding out inputs that contributed to its computation.  If you insert this op
in the graph it inputs are masked from the gradient generator.  They are not
taken into account for computing gradients.

This is useful any time you want to compute a value with TensorFlow but need
to pretend that the value was a constant. Some examples include:

*  The *EM* algorithm where the *M-step* should not involve backpropagation
   through the output of the *E-step*.
*  Contrastive divergence training of Boltzmann machines where, when
   differentiating the energy function, the training must not backpropagate
   through the graph that generated the samples from the model.
*  Adversarial training, where no backprop should happen through the adversarial
   example generation process.

StringToHashBucket
string_tensorD
output8A Tensor of the same shape as the input `string_tensor`.	".
num_bucketsint"The number of buckets.(0*PConverts each string in the input Tensor to its hash mod by a number of buckets.2The hash function is deterministic on the content of the string within the
process.

Note that the hash function may change from time to time.
ů
StringToNumber
string_tensorL
output8A Tensor of the same shape as the input `string_tensor`."out_type"\
out_typetype0">The numeric type to interpret each string in string_tensor as.:
2*GConverts each string in the input Tensor to the specified numeric type.2_(Note that int32 overflow results in an error while float overflow
results in a rounded value.)
P
Sub
x"T
y"T
z"T"
Ttype:	
2	*Returns x - y element-wise.

Sum!
inputThe tensor to reduce."T0
reduction_indicesThe dimensions to reduce. 
outputThe reduced tensor."T"H
	keep_dimsbool( "1If true, retain reduced dimensions with length 1."
Ttype:
2	*;Computes the sum of elements across dimensions of a tensor.2÷Reduces `input` along the dimensions given in `reduction_indices`. Unless
`keep_dims` is true, the rank of the tensor is reduced by 1 for each entry in
`reduction_indices`. If `keep_dims` is true, the reduced dimensions are
retained with length 1.

Switch@
data5The tensor to be forwarded to the appropriate output."TF
pred<A scalar that specifies which output port will receive data.
M
output_false:If `pred` is false, data will be forwarded to this output."TK
output_true9If `pred` is true, data will be forwarded to this output."T"	
Ttype*8Forwards `data` to the output port determined by `pred`.2If `pred` is true, the `data` input is forwarded to `output_true`. Otherwise,
the data goes to `output_false`.

See also `RefSwitch` and `Merge`.
ĺ
SymbolicGradient4
input&a list of input tensors of size N + M;2Tin3
output#a list of output tensors of size N;2Tout"8
Tin
list(type)"!the type list for the input list.(0"9
Tout
list(type)"!the type list for the input list.(0"Ź
ffunc" The function we want to compute the gradient for.

The function 'f' must be a numerical function which takes N inputs and
produces M outputs. Its gradient function 'g', which is computed by
this SymbolicGradient op is a function taking N + M inputs and
produces N outputs.

I.e. if we have
   (y1, y2, ..., y_M) = f(x1, x2, ..., x_N),
then, g is
   (dL/dx1, dL/dx2, ..., dL/dx_N) = g(x1, x2, ..., x_N,
                                     dL/dy1, dL/dy2, ..., dL/dy_M),

where L is a scalar-value function of (x1, x2, ..., xN) (e.g., the
loss function). dL/dx_i is the partial derivative of L with respect
to x_i.

(Needs some math expert to say the comment above better.)*BComputes the gradient function for function f via backpropagation.
¤
TFRecordReader9
reader_handle#The handle to reference the Reader."|
	containerstring "cIf non-empty, this reader is placed in the given container.
Otherwise, a default container is used."
shared_namestring "wIf non-empty, this reader is named in the given bucket
with this shared_name. Otherwise, the node name is used instead.*AA Reader that outputs the records from a TensorFlow Records file.
^
Tanh
x"T
y"T"
Ttype:	
2	*0Computes hyperbolic tangent of `x` element-wise.
Ć
TemporaryVariable4
ref#A reference to the variable tensor."dtype"1
shapeshape"!The shape of the variable tensor.";
dtypetype",The type of elements in the variable tensor."Ť
var_namestring "Overrides the name used for the temporary variable resource. Default
value is the name of the 'TemporaryVariable' op (which is guaranteed unique).*MReturns a tensor that may be mutated, but only persists within a single step.2This is an experimental op for internal use only and it is possible to use this
op in unsafe ways.  DO NOT USE unless you fully understand the risks.

It is the caller's responsibility to ensure that 'ref' is eventually passed to a
matching 'DestroyTemporaryVariable' op after all other uses have completed.

Outputs a ref to the tensor state so it may be read or modified.

  E.g.
      var = state_ops._temporary_variable([1, 2], types.float_)
      var_name = var.op.name
      var = state_ops.assign(var, [[4.0, 5.0]])
      var = state_ops.assign_add(var, [[6.0, 7.0]])
      final = state_ops._destroy_temporary_variable(var, var_name=var_name)

TensorArray 
sizeThe size of the array.-
handleThe handle to the TensorArray."<
dtypetype"-The type of the elements on the tensor_array."
dynamic_sizebool( "{A boolean that determines whether writes to the TensorArray
are allowed to grow the size.  By default, this is not allowed."ľ
clear_after_readbool("If true (default), Tensors in the TensorArray are cleared
after being read.  This disables multiple read semantics but allows early
release of memory."˛
tensor_array_namestring "Overrides the name used for the temporary tensor_array
resource. Default value is the name of the 'TensorArray' op (which
is guaranteed unique).*GAn array of Tensors of given size, with data written via Write and read2via Read or Pack.
ö
TensorArrayCloseV
handleGThe handle to a TensorArray (output of TensorArray or TensorArrayGrad).*ADelete the TensorArray from its resource container.  This enables2Gthe user to close and release the resource in the middle of a step/run.
 
TensorArrayConcat+
handleThe handle to a TensorArray.H
flow_in;A float scalar that enforces proper chaining of operations.Z
valueJAll of the elements in the TensorArray, concatenated along the first
axis."dtypeĄ
lengthsA vector of the row sizes of the original T elements in the
value output.  In the example above, this would be the values:
`(n1, n2, ..., n(T-1))`.	"5
dtypetype"&The type of the elem that is returned.*<Concat the elements from the TensorArray into value `value`.2Takes `T` elements of shapes

  ```
  (n0 x d0 x d1 x ...), (n1 x d0 x d1 x ...), ..., (n(T-1) x d0 x d1 x ...)
  ```

and concatenates them into a Tensor of shape:

  ```(n0 + n1 + ... + n(T-1) x d0 x d1 x ...)```

All elements must have the same shape (excepting the first dimension).
ó
TensorArrayGrad
handle
flow_in
grad_handle"
sourcestring*NCreates a TensorArray for storing the gradients of values in the given handle.2ĘIf the given TensorArray gradient already exists, returns a reference to it.

Locks the size of the original TensorArray by disabling its dynamic size flag.

**A note about the input flow_in:**

The handle flow_in forces the execution of the gradient lookup to occur
only after certain other operations have occurred.  For example, when
the forward TensorArray is dynamically sized, writes to this TensorArray
may resize the object.  The gradient TensorArray is statically sized based
on the size of the forward TensorArray when this operation executes.
Furthermore, the size of the forward TensorArray is frozen by this call.
As a result, the flow is used to ensure that the call to generate the gradient
TensorArray only happens after all writes are executed.

In terms of e.g. python TensorArray sugar wrappers when using dynamically sized

TensorArrayPack+
handleThe handle to a TensorArray.H
flow_in;A float scalar that enforces proper chaining of operations.l
value\All of the elements in the TensorArray, concatenated along a new
axis (the new dimension 0)."dtype"5
dtypetype"&The type of the elem that is returned.*;Pack the elements from the TensorArray into output `value`.2&All elements must have the same shape.
Ä
TensorArrayRead+
handleThe handle to a TensorArray.	
indexH
flow_in;A float scalar that enforces proper chaining of operations.=
value-The tensor that is read from the TensorArray."dtype"5
dtypetype"&The type of the elem that is returned.*9Read an element from the TensorArray into output `value`.

TensorArraySizeV
handleGThe handle to a TensorArray (output of TensorArray or TensorArrayGrad).H
flow_in;A float scalar that enforces proper chaining of operations..
size$The current size of the TensorArray.*(Get the current size of the TensorArray.
°
TensorArraySplit+
handleThe handle to a TensorArray.@
value4The concatenated tensor to write to the TensorArray."TX
lengthsKThe vector of lengths, how to split the rows of value into the
TensorArray.	H
flow_in;A float scalar that enforces proper chaining of operations.I
flow_out;A float scalar that enforces proper chaining of operations."	
Ttype*>Split the data from the input value into TensorArray elements.2ňAssuming that `lengths` takes on values

  ```(n0, n1, ..., n(T-1))```

and that `value` has shape

  ```(n0 + n1 + ... + n(T-1) x d0 x d1 x ...)```,

this splits values into a TensorArray with T tensors.

TensorArray index t will be the subtensor of values with starting position

  ```(n0 + n1 + ... + n(t-1), 0, 0, ...)```

and having size

  ```nt x d0 x d1 x ...```
ă
TensorArrayUnpack+
handleThe handle to a TensorArray.@
value4The concatenated tensor to write to the TensorArray."TH
flow_in;A float scalar that enforces proper chaining of operations.I
flow_out;A float scalar that enforces proper chaining of operations."	
Ttype*?Unpack the data from the input value into TensorArray elements.
ů
TensorArrayWrite+
handleThe handle to a TensorArray.;
index0The position to write to inside the TensorArray.3
value'The tensor to write to the TensorArray."TH
flow_in;A float scalar that enforces proper chaining of operations.I
flow_out;A float scalar that enforces proper chaining of operations."	
Ttype*&Push an element onto the tensor_array.
ř
TextLineReader9
reader_handle#The handle to reference the Reader."W
skip_header_linesint "9Number of lines to skip from the beginning of every file."|
	containerstring "cIf non-empty, this reader is placed in the given container.
Otherwise, a default container is used."
shared_namestring "wIf non-empty, this reader is named in the given bucket
with this shared_name. Otherwise, the node name is used instead.*<A Reader that outputs the lines of a file delimited by '\n'.
ß
#ThreadUnsafeUnigramCandidateSampler
true_classesA batch_size * num_true matrix, in which each row contains the
IDs of the num_true target_classes in the corresponding original label.	o
sampled_candidatesWA vector of length num_sampled, in which each element is
the ID of a sampled candidate.	Ě
true_expected_count˛A batch_size * num_true matrix, representing
the number of times each candidate is expected to occur in a batch
of sampled candidates. If unique=true, then this is a probability.ę
sampled_expected_countÍA vector of length num_sampled, for each sampled
candidate representing the number of times the candidate is expected
to occur in a batch of sampled candidates.  If unique=true, then this is a
probability."7
num_trueint""Number of true labels per context.(0"J
num_sampledint"2Number of candidates to randomly sample per batch.(0"Ë
uniquebool"şIf unique is true, we sample with rejection, so that all sampled
candidates in a batch are unique. This requires some approximation to
estimate the post-rejection sampling probabilities."X
	range_maxint"BThe sampler will sample integers from the interval [0, range_max).(0"Ľ
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision.*LGenerates labels for candidate sampling with a learned unigram distribution.2See explanations of candidate sampling and the data formats at
go/candidate-sampling.

For each batch, this op picks a single set of sampled candidate labels.

The advantages of sampling candidates per-batch are simplicity and the
possibility of efficient dense matrix multiplication. The disadvantage is that
the sampled candidates must be chosen independently of the context and of the
true labels.
ý
Tile
input1-D or higher."TR
	multiplesC1-D. Length must be the same as the number of dimensions in `input`
output"T"	
Ttype*-Constructs a tensor by tiling a given tensor.2˝This operation creates a new tensor by replicating `input` `multiples` times.
The output tensor's i'th dimension has `input.dims(i) * multiples[i]` elements,
and the values of `input` are replicated `multiples[i]` times along the 'i'th
dimension. For example, tiling `[a b c d]` by `[2]` produces
`[a b c d a b c d]`.

TileGrad

input"T
	multiples
output"T"	
Ttype*Returns the gradient of `Tile`.2ľSince `Tile` takes an input and repeats the input `multiples` times
along each dimension, `TileGrad` takes in `multiples` and aggregates
each repeated tile of `input` into `output`.

TopK;
input/1-D or higher with last dimension at least `k`."TH
values;The `k` largest elements along each last dimensional slice."TJ
indices=The indices of `values` within the last dimension of `input`."f
kint"ZNumber of top elements to look for along the last dimension (along each
row for matrices).("h
sortedbool("TIf true the resulting `k` elements will be sorted by the values in
descending order."
Ttype:
2		*LFinds values and indices of the `k` largest elements for the last dimension.2If the input is a vector (rank-1), finds the `k` largest entries in the vector
and outputs their values and indices as vectors.  Thus `values[j]` is the
`j`-th largest entry in `input`, and its index is `indices[j]`.

For matrices (resp. higher rank input), computes the top `k` entries in each
row (resp. vector along the last dimension).  Thus,

    values.shape = indices.shape = input.shape[:-1] + [k]

If two elements are equal, the lower-index element appears first.

If `k` varies dynamically, use `TopKV2` below.
˝
TopKV2;
input/1-D or higher with last dimension at least `k`."Tg
k`0-D.  Number of top elements to look for along the last dimension (along each
row for matrices).H
values;The `k` largest elements along each last dimensional slice."TJ
indices=The indices of `values` within the last dimension of `input`."h
sortedbool("TIf true the resulting `k` elements will be sorted by the values in
descending order."
Ttype:
2		*LFinds values and indices of the `k` largest elements for the last dimension.2¤If the input is a vector (rank-1), finds the `k` largest entries in the vector
and outputs their values and indices as vectors.  Thus `values[j]` is the
`j`-th largest entry in `input`, and its index is `indices[j]`.

For matrices (resp. higher rank input), computes the top `k` entries in each
row (resp. vector along the last dimension).  Thus,

    values.shape = indices.shape = input.shape[:-1] + [k]

If two elements are equal, the lower-index element appears first.

This is the same as `TopK`, but takes `k` as in input rather than an attr.
ř
	Transpose
x"T
perm
y"T"	
Ttype*3Shuffle dimensions of x according to a permutation.2The output `y` has the same rank as `x`. The shapes of `x` and `y` satisfy:
  `y.shape[i] == x.shape[perm[i]] for i in [0, 1, ..., rank(x) - 1]`
Î
TruncatedNormal+
shapeThe shape of the output tensor."T\
outputKA tensor of the specified shape filled with random truncated normal
values."dtype"Š
seedint "If either `seed` or `seed2` are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."8
seed2int "&A second seed to avoid seed collision.".
dtypetype"The type of the output.:
2"
Ttype:
2	*;Outputs random values from a truncated normal distribution.2ĆThe generated values follow a normal distribution with mean 0 and standard
deviation 1, except that values whose magnitude is more than 2 standard
deviations from the mean are dropped and re-picked.
Ë
UniformCandidateSampler
true_classesA batch_size * num_true matrix, in which each row contains the
IDs of the num_true target_classes in the corresponding original label.	o
sampled_candidatesWA vector of length num_sampled, in which each element is
the ID of a sampled candidate.	Ě
true_expected_count˛A batch_size * num_true matrix, representing
the number of times each candidate is expected to occur in a batch
of sampled candidates. If unique=true, then this is a probability.ę
sampled_expected_countÍA vector of length num_sampled, for each sampled
candidate representing the number of times the candidate is expected
to occur in a batch of sampled candidates.  If unique=true, then this is a
probability."7
num_trueint""Number of true labels per context.(0"J
num_sampledint"2Number of candidates to randomly sample per batch.(0"Ë
uniquebool"şIf unique is true, we sample with rejection, so that all sampled
candidates in a batch are unique. This requires some approximation to
estimate the post-rejection sampling probabilities."X
	range_maxint"BThe sampler will sample integers from the interval [0, range_max).(0"Ľ
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision.*DGenerates labels for candidate sampling with a uniform distribution.2See explanations of candidate sampling and the data formats at
go/candidate-sampling.

For each batch, this op picks a single set of sampled candidate labels.

The advantages of sampling candidates per-batch are simplicity and the
possibility of efficient dense matrix multiplication. The disadvantage is that
the sampled candidates must be chosen independently of the context and of the
true labels.
Đ
Unique
x1-D."T
y1-D."T
idx1-D."	
Ttype*&Finds unique elements in a 1-D tensor.2çThis operation returns a tensor `y` containing all of the unique elements of `x`
sorted in the same order that they occur in `x`. This operation also returns a
tensor `idx` the same size as `x` that contains the index of each value of `x`
in the unique output `y`. In other words:

`y[idx[i]] = x[i] for i in [0, 1,...,rank(x) - 1]`

For example:

```prettyprint
# tensor 'x' is [1, 1, 2, 4, 4, 4, 7, 8, 8]
y, idx = unique(x)
y ==> [1, 2, 4, 7, 8]
idx ==> [0, 0, 1, 2, 2, 2, 3, 4, 4]
```
ú
UniqueWithCounts
x1-D."T
y1-D."T
idx1-D.
count1-D."	
Ttype*&Finds unique elements in a 1-D tensor.2öThis operation returns a tensor `y` containing all of the unique elements of `x`
sorted in the same order that they occur in `x`. This operation also returns a
tensor `idx` the same size as `x` that contains the index of each value of `x`
in the unique output `y`. Finally, it returns a third tensor `count` that
contains the count of each element of `y` in `x`. In other words:

`y[idx[i]] = x[i] for i in [0, 1,...,rank(x) - 1]`

For example:

```prettyprint
# tensor 'x' is [1, 1, 2, 4, 4, 4, 7, 8, 8]
y, idx, count = unique_with_counts(x)
y ==> [1, 2, 4, 7, 8]
idx ==> [0, 0, 1, 2, 2, 2, 3, 4, 4]
count ==> [2, 1, 3, 1, 2]
```
É
Unpack6
value*1-D or higher, with first dimension `num`."T<
output*The list of tensors unpacked from `value`."T*num"
numint("	
Ttype*QUnpacks the outer dimension of a rank-`R` tensor into `num` rank-`(R-1)` tensors.2ÜUnpacks `num` tensors from `value` by chipping it along the first dimension.
The i'th tensor in `output` is the slice `value[i, ...]`. Each tensor in
`output` has shape `value.shape[1:]`.

This is the opposite of `pack`.
Ń
UnsortedSegmentSum	
data"Tb
segment_idsIA 1-D tensor whose rank is equal to the rank of `data`'s
first dimension."Tindices
num_segmentsZ
outputMHas same shape as data, except for dimension 0 which
has size `num_segments`."T"
Ttype:
2		"
Tindicestype:
2	*,Computes the sum along segments of a tensor.2űRead [the section on
Segmentation](../../api_docs/python/math_ops.md#segmentation) for an explanation
of segments.

Computes a tensor such that
\\(output_i = \sum_j data_j\\) where sum is over `j` such
that `segment_ids[j] == i`. Unlike `SegmentSum`, `segment_ids`
need not be sorted and need not cover all values in the full
  range of valid values.

If the sum is empty for a given segment ID `i`, `output[i] = 0`.

`num_segments` should equal the number of distinct segment IDs.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/UnsortedSegmentSum.png" alt>
</div>
°
Variable4
ref#A reference to the variable tensor."dtype"1
shapeshape"!The shape of the variable tensor.";
dtypetype",The type of elements in the variable tensor."~
	containerstring "eIf non-empty, this variable is placed in the given container.
Otherwise, a default container is used."
shared_namestring "yIf non-empty, this variable is named in the given bucket
with this shared_name. Otherwise, the node name is used instead.*?Holds state in the form of a tensor that persists across steps.2˘Outputs a ref to the tensor state so it may be read or modified.
TODO(zhifengc/mrry): Adds a pointer to a more detail document
about sharing states in tensorflow.
ó	
Where	
input
	
index	*5Returns locations of true values in a boolean tensor.2	This operation returns the coordinates of true elements in `input`. The
coordinates are returned in a 2-D tensor where the first dimension (rows)
represents the number of true elements, and the second dimension (columns)
represents the coordinates of the true elements. Keep in mind, the shape of
the output tensor can vary depending on how many true values there are in
`input`. Indices are output in row-major order.

For example:

```prettyprint
# 'input' tensor is [[True, False]
#                    [True, False]]
# 'input' has two true values, so output has two coordinates.
# 'input' has rank of 2, so coordinates have two indices.
where(input) ==> [[0, 0],
                  [1, 0]]

# `input` tensor is [[[True, False]
#                     [True, False]]
#                    [[False, True]
#                     [False, True]]
#                    [[False, False]
#                     [False, True]]]
# 'input' has 5 true values, so output has 5 coordinates.
# 'input' has rank of 3, so coordinates have three indices.
where(input) ==> [[0, 0, 0],
                  [0, 1, 0],
                  [1, 0, 1],
                  [1, 1, 1],
                  [2, 1, 1]]
```
¤
WholeFileReader9
reader_handle#The handle to reference the Reader."|
	containerstring "cIf non-empty, this reader is placed in the given container.
Otherwise, a default container is used."
shared_namestring "wIf non-empty, this reader is named in the given bucket
with this shared_name. Otherwise, the node name is used instead.*?A Reader that outputs the entire contents of a file as a value.2To use, enqueue filenames in a Queue.  The output of ReaderRead will
be a filename (key) and the contents of that file (value).
ş
	ZerosLike
xa tensor of type T."TG
y?a tensor of the same shape and type as x but filled with zeros."T"	
Ttype*<Returns a tensor of zeros with the same shape and type as x.