
/**********************************************************************************
 *
 * Given an array of integers, find two numbers such that they add up to a specific target number.
 *
 * The function twoSum should return indices of the two numbers such that they add up to the target,
 * where index1 must be less than index2. Please note that your returned answers (both index1 and index2)
 * are not zero-based.
 *
 * You may assume that each input would have exactly one solution.
 *
 * Input: numbers={2, 7, 11, 15}, target=9
 * Output: index1=1, index2=2
 *
 *
 **********************************************************************************/

/*
 *   The easy solution is O(n^2) run-time complexity.
 *   ```
 *       foreach(item1 in array) {
 *           foreach(item2 in array){
 *               if (item1 + item2 == target) {
 *                   return result
 *               }
 *           }
 *   ```
 *
 *   We can see the nested loop just for searching,
 *   So, we can use a hashmap to reduce the searching time complexity from O(n) to O(1)
 *   (the map's `key` is the number, the `value` is the position)
 *
 *   But be careful, if there are duplication numbers in array,
 *   how the map store the positions for all of same numbers?
 *
 */

func twoSum() -> Array<Int> {
    let numbers = [2, 7, 11, 15]
    let targer = 9

    var low = 0
    var high = numbers.count - 1
    
    while (low < high) {
        if (numbers[low] + numbers[high]) == targer {
            return [numbers[low], numbers[high]]
        } else {
            numbers[low] + numbers[high] > targer ? (high = high - 1) : (low = low + 1)
        }
    }
    
    return []
}
//twoSum()


/**********************************************************************************
 *
 * Given a string, find the length of the longest substring without repeating characters.
 * For example, the longest substring without repeating letters for "abcabcbb" is "abc",
 * which the length is 3. For "bbbbb" the longest substring is "b", with the length of 1.
 *
 **********************************************************************************/

func lenghtOfLongestSubstring1(s: String) -> Int {

    var set = Set<Character>()
    
    for char in s.characters {
        set.insert(char)
    }
    print(set.sorted())
    return set.count
}

//lenghtOfLongestSubstring1(s: "abccccc")



/**********************************************************************************
 *
 * There are two sorted arrays A and B of size m and n respectively.
 * Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 *
 
 Example 1:
 nums1 = [1, 3]
 nums2 = [2]
 
 The median is 2.0
 Example 2:
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 The median is (2 + 3)/2 = 2.5
 
 **********************************************************************************/


func findMedianSortedArrays(A: [Int], m: Int, B: [Int], n: Int) -> Double {
    
    if m == 0 && n == 0 {
        return 0.0
    }
    
    if m == 0 {
        return Double(n%2 == 1 ? B[n/2] : (B[n/2 - 1] + B[n/2])/2)
    }
    if n == 0 {
        return Double(m%2 == 1 ? A[m/2] : (A[m/2 - 1] + A[m/2])/2)
    }
    
    if m>n {
        return findmedianSortedArrayHelper(A: A, m: m, B: B, n: n, lowA: 0, highA: m-1, lowB: 0, highB: n-1)
    }
    
    return findmedianSortedArrayHelper(A: B, m: n, B: A, n: m, lowA: 0, highA: n-1, lowB: 0, highB: m-1)
}

func findmedianSortedArrayHelper(A: [Int], m: Int, B: [Int], n: Int, lowA: Int, highA: Int, lowB: Int, highB: Int) -> Double {
    
    var lowB = lowB
    var lowA = lowA
    let mid = lowA + (highA - lowA)/2
    let pos = binarySearch(A: B, low: lowB, high: highB, key: A[mid])
    let num = mid + pos
    
    if num == (m+n)/2 {
        
        if (m+n)%2 == 1 {
            return Double(A[mid])
        }
        
        let next = 0
        
        if mid > 0 && pos > 0 {
            
        } else if pos > 0 {
            
        } else if mid > 0 {
            
        }
        
        return Double(A[mid] + next)/2.0
        
    }
    
    if num < (m+n)/2 {
        lowA = mid + 1
        lowB = pos
        if (highA - lowA) > (highB - lowB) {
            
        }
    }
    
    return 0.0
}


// Classical binary search algorithm, but slightly different
// if cannot find the key, return the position where can insert the key
func binarySearch(A: [Int], low: Int, high: Int, key: Int) -> Int {
    
    var high = high
    var low = low
    while (low <= high) {
        let mid = low + (high - low)/2
        if key == A[mid] {
            return mid
        }
        if key > A[mid] {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    return low
}

/*
现在给你两个这样结构的链表，请输出它们求和之后的结果。例如：

输入: (2 -> 4 -> 1) + (5 -> 6 -> 1)
输出: 7 -> 0 -> 3
 
 */

private class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

private class Solution {
    private func getNodeValue(_ node: ListNode?) -> Int {
        return node.flatMap{ $0.val } ?? 0
    }
    
    func addTwoNumber(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
//        guard let l1 = l1, let l2 = l2 else {
//            return nil
//        }
        var p1 = l1
        var p2 = l2
        let result: ListNode? = ListNode(0)
        var current = result
        var extra = 0
        
        while p1 != nil || p2 != nil || extra != 0 {
            var tot = getNodeValue(p1) + getNodeValue(p2) + extra
            extra = tot / 10
            tot = tot % 10
            let sum: ListNode? = ListNode(tot)
            current?.next = sum
            current = sum
            p1 = p1.flatMap { $0.next }
            p2 = p2.flatMap { $0.next }
        }
        return nil
    }
}











