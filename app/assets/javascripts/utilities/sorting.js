document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.sort-by-title')

  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  var table = document.querySelector('table')

  // NodeList
  var rows = table.querySelectorAll('tr')
  var sortedRows = []

  // select all rows except the first row (it is a header)
  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  var arrowUp = this.querySelector('.octicon-arrow-up')

  // sort rows condition
  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-up').classList.add('hide')
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
  }

  // create new table
  var sortedTable = document.createElement('table')
  // Add headers
  sortedTable.appendChild(rows[0])
  // add all classes from source table
  for (var i = 0; i < table.classList.length; i++) {
    sortedTable.classList.add(table.classList[i])
  }
  // add sorted elements
  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentElement.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
