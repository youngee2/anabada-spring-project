package com.example.demo.board.comment;
import java.util.List;
import java.util.Vector;


import jakarta.servlet.ServletContext;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;


public class CommentDAO  {

	private final JdbcTemplate jdbcTemplate;
	
	//의존성 주입
	public CommentDAO(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	// 교환 게시판 댓글 목록 가져오기
	public List<CommentDTO> selectExcCommList(int titlenum) {


		String sql = "select * from CommentTB where board_num=0 and title_num =" + titlenum;
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(CommentDTO.class),titlenum);
	}

	// 게시판 댓글 작성하기
	public int commentWrite(CommentDTO dto) {
			String sql = "insert into commentTB(" + "comm_num, idx, board_num, title_num, comm, nickname) " + "values ("
					+ "seq_comm_num.NEXTVAL,?, ?, ?, ?, ?)";

		return jdbcTemplate.update(sql,
				dto.getIdx(),dto.getBoard_num(), dto.getTitle_num(),dto.getComm(),dto.getNickname());
	}


	// 교환 게시판 댓글 삭제하기
	public int delete_exc_Comment(CommentDTO dto) {
		String sql = "delete from commentTB where comm_num=?";
		return jdbcTemplate.update(sql, dto.getComm_num());
	}

	public List<CommentDTO> free_comm_List(int titlenum) {
		List<CommentDTO> list = new Vector<CommentDTO>();
		String sql = "select * from CommentTB where board_num=2 and title_num =" + titlenum;

		return list;
	}

	// 자유게시판 댓글 작성하기
	public int free_commentWrite(CommentDTO dto) {
		String sql = "insert into commentTB(" + " comm_num, idx, board_num, title_num, comm, nickname) "
					+ "values (" + " seq_comm_num.nextval, ?, ?, ?, ?, ?)";
		return 1;
	}

	//자유게시판 댓글 삭제
	public int free_delete_Comment(CommentDTO dto) {
		String sql = "delete from commentTB where comm_num=? ";
		return jdbcTemplate.update(sql, dto.getComm_num());
	}

}