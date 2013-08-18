assert = require './assert'

suite 'assignment'

test "variables are case-sensitive", ->
	assert.compileTo '''
		$width = 960px;
		$Width = 480px;
		body {
			width: $width;
		}
	''', '''
		body {
			width: 960px;
		}
	'''

test "?= after =", ->
	assert.compileTo '''
		$width = 960px;
		$width ?= 480px;
		body {
			width: $width;
		}
	''', '''
		body {
			width: 960px;
		}
	'''

test "lone ?= ", ->
	assert.compileTo '''
		$width ?= 480px;
		body {
			width: $width;
		}
	''', '''
		body {
			width: 480px;
		}
	'''

test "+=", ->
	assert.compileTo '''
		$width = 480px;
		$width += 100px;
		body {
			width: $width;
		}
	''', '''
		body {
			width: 580px;
		}
	'''

test "-=", ->
	assert.compileTo '''
		$width = 480px;
		$width -= 100px;
		body {
			width: $width;
		}
	''', '''
		body {
			width: 380px;
		}
	'''

test "*=", ->
	assert.compileTo '''
		$width = 480px;
		$width *= 10;
		body {
			width: $width;
		}
	''', '''
		body {
			width: 4800px;
		}
	'''

test "/=", ->
	assert.compileTo '''
		$width = 480px;
		$width /= 10;
		body {
			width: $width;
		}
	''', '''
		body {
			width: 48px;
		}
	'''

test "/= 0, not allowed", ->
	assert.failAt '''
		$width = 480px;
		$width /= 0;
	''', { line: 2, column: 11 }

test "%=", ->
	assert.compileTo '''
		$width = 480px;
		$width %= 100;
		body {
			width: $width;
		}
	''', '''
		body {
			width: 80px;
		}
	'''