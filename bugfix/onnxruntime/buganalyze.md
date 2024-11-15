- ERROR.LOG
`
2024-11-15 02:33:03.847241879 [E:onnxruntime:Default, env.cc:254 ThreadMain] pthread_setaffinity_np failed for thread: 152275, index: 97, mask: {49, }, error code: 22 error msg: Invalid argument. Specify the number of threads explicitly so the affinity is not set.
2024-11-15 02:33:03.847242179 [E:onnxruntime:Default, env.cc:254 ThreadMain] pthread_setaffinity_np failed for thread: 152255, index: 77, mask: {39, }, error code: 22 error msg: Invalid argument. Specify the number of threads explicitly so the affinity is not set.
`

- REASON
Refer: https://github.com/microsoft/onnxruntime/issues/8313
  The issue is because of CPU affinity set for new created threads, the default assigned CPU core may not be available from job scheduler when cgroup is enabled. One solution is to override the function pthread_setaffinity_np.

- FIX
`bash fix.sh`