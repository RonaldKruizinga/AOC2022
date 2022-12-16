class Object
    def is_number?
      to_f.to_s == to_s || to_i.to_s == to_s
    end
  end

$size = 0
$directories = {}
$directories_sizes = {}
def calculate_sizes(dir)
  directory_size = 0
  $directories[dir].each do |v|
    directory_size += if !v.is_number?
      if dir == '/'
        calculate_sizes(dir + v)
      else
        calculate_sizes("#{dir}/#{v}")
      end
    else
      v.to_i
    end
  end

  if directory_size <= 100_000
    $size += directory_size
  end

  $directories_sizes[dir] = directory_size

  return directory_size
end

commands = File.readlines('Day7/input.txt', chomp: true)

current_directory = ''

commands.each do |c|
  if c.start_with? '$'
    current_command = c[2..]
    if current_command.start_with? 'cd'
      path_change = current_command[3..]
      case path_change
      when '..'
        current_directory = current_directory.rpartition('/').first
      when '/'
        current_directory += path_change
        $directories[current_directory] = []
      else
        current_directory += if current_directory == '/'
          path_change
        else
          "/#{path_change}"
        end
        $directories[current_directory] = []
      end
    end
    next
  end

  value_to_append = if c.start_with? 'dir'
    c.split[1]
  else
    c.split[0]
  end

  $directories[current_directory].append value_to_append
end

calculate_sizes('/')
puts $size

remainder = 70_000_000 - $directories_sizes['/']
needed = 30_000_000 - remainder

size_values = $directories_sizes.values
puts size_values.filter { |x| x > needed}.sort.first
