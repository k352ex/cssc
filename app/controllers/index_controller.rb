class IndexController < ApplicationController

	def index
		@post = Post.all.last(5) 		# 공지 게시판 최근 게시물 5개
		@board = Board.all.last(5)		# 자유 게시판 최근 게시물 5개

		@PostCount = Post.all.size 		# 공지 게시판 게시글 갯수
		@BoardCount = Board.all.size    # 자유 게시판 게시글 갯수
	end

end
