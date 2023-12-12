package reservation.lecture;

public interface LectureInterface {
   public int  lectureInsert(LectureVO vo);
   public int  lectureCountAll( );
   public int  lectureCountAll( String search);
   public void lectureDelete(String data);
   
   //전체출력,한건상세,한건삭제,한건수정처리 메소드 선언은 일단 생략함
} //end
