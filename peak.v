module main

fn find_min(list []int, l int, r int) int {
	m := (l + r + 1) / 2
	return match true {
		(list[m] < list[m+1]) && (list[m] < list[m-1]) { m }
		(list[m] < list[m+1]) && (m == l) { m }
		(list[m] < list[m-1]) && (m == r) { m }
		(list[m] <= list[m-1]) { find_min(list, m+1, r) }
		(list[m] <= list[m+1]) { find_min(list, l, m-1) }
		else { -1 }
	}
}

fn find_max(list []int, l int, r int) int {
	m := (l + r + 1) / 2
	return match true {
		(list[m] > list[m+1]) && (list[m] > list[m-1]) { m }
		(list[m] > list[m+1]) && (m == l) { m }
		(list[m] > list[m-1]) && (m == r) { m }
		(list[m] <= list[m-1]) { find_max(list, m+1, r) }
		(list[m] <= list[m+1]) { find_max(list, l, m-1) }
		else { -1 }
	}
}

fn main() {
	list := [ -1, 1, 2, 4, 3, 0 ]

	println(list)

	imax := find_max(list, 0, list.cap-1)
	imin := find_min(list, 0, list.cap-1)
	println('max index: $imax')
	println('min index: $imin')
}
