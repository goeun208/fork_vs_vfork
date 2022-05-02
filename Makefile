CFLAGS = -O3 -Wall
CC = gcc
OBJS = fork_vs_vfork.o
SRCS = fork_vs_vfork.c


fork_vs_vfork: $(OBJS)
  $(CC) -o fork_vs_vfork.out $(CFLAGS) $(OBJS)

fork_vs_vfork.o: $(SRCS)
  $(CC) -c $(CFLAGS) $(SRCS)
  
test: fork_vs_vfork.out
  @echo "fork 1GB"
  ./fork_vs_vfork 1 0
  @echo "vfork 1GB"
  ./fork_vs_vfork 1 1

clean:
  @rm -f $(OBJS)
  @rm -f fork_vs_vfork.out