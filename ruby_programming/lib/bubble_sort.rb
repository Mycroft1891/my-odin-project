def bubble_sort(arr)
  return arr if arr.size <= 1
  processing = true
  while processing
    processing = false
    for i in (0..(arr.size - 2)) do
      if arr[i] > arr[i + 1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        processing = true
      end
    end
  end
  arr
end

bubble_sort([2,5,3,1,4])
bubble_sort((0..1000).to_a.reverse)
