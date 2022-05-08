import java.util.*;
import hsplet.HSPError;
import hsplet.function.FunctionBase;
import hsplet.variable.*;
import hsplet.Context;
import ec.util.MersenneTwister;
import QuickSort.QuickSort;;

public class hspda extends FunctionBase {

	private static Vector sortget;

	/** ���̃N���X���܂ރ\�[�X�t�@�C���̃o�[�W����������B */
	private static final String fileVersionID = "$Id: hspda.java,v 0.11 2008/01/16 08:00:00 OpenHSP Exp $";
	/* v 0.11 OpenHSP�ֈڍs�E�N���X�t�@�C���̍\����ύX */

	// -------------------------------------------
	// sort�`�n

	public static void sortget(final Context context, final Operand op, final int oi, final int index){

		if (sortget == null) {
			// sortget������`�̏ꍇ�A�V�X�e���G���[
			context.error(HSPError.SystemError, "sortget", "not sorted");
			return;
		}
		if (index < 0 || sortget.size() <= index) {
			// ����`�͈̔͂̏ꍇ�A �G���[�ɂ͂Ȃ炸�A���0���Ԃ�
			op.assign(oi, Scalar.fromValue(0), 0);
		} else {
			op.assign(oi, Scalar.fromValue(objToInt(sortget.get(index))), 0);
		}
	}

	/**
	 * Object�^����int�^�֕ϊ�
	 * @param object int�^�֕ϊ�����Object
	 * @return object��int�^�֕ϊ������l
	 * @author eller
	 */
	private static int objToInt(final Object object) {

		return Integer.parseInt(object.toString());
	}

	/**
	 * ���l�^�i�����^�������^�j�z��ϐ����\�[�g
	 * @param context
	 * @param op �\�[�g����z��ϐ�
	 * @param oi 
	 * @param sortmode 0�ȊO�Ȃ�~���Ƀ\�[�g
	 */
	public static void sortval(final Context context, final Operand op, final int oi, final int sortmode){

		QuickSort.sort(context, op, sortmode!=0);
		if (QuickSort.existOldIndexes())
			sortget = QuickSort.getOldIndexes();
	}

	/**
	 * ������^�z��ϐ����\�[�g
	 * @param context
	 * @param op �\�[�g����z��ϐ�
	 * @param oi 
	 * @param sortmode 0�ȊO�Ȃ�~���Ƀ\�[�g
	 */
	public static void sortstr(final Context context, final Operand op, final int oi, final int sortmode){
		
		QuickSort.sort(context, op, sortmode!=0);
		if (QuickSort.existOldIndexes())
			sortget = QuickSort.getOldIndexes();
	}

	/**
	 * ������^�ϐ����\�[�g
	 * @param context
	 * @param op �\�[�g����ϐ�
	 * @param oi 
	 * @param sortmode 0�ȊO�Ȃ�~���Ƀ\�[�g
	 */
	public static void sortnote(final Context context, Operand op, final int oi, final int sortmode){

		// ������line�����s�ŋ�؂���sa�֑������
		String s[] = op.toString(oi).split("\\r\\n|\\n", -1);
		StringArray sa = new StringArray(64, s.length, 1, 1, 1);
		for (int i=0; i<s.length; i++) {
			sa.assign(i, Scalar.fromValue(s[i]), 0);
		}

		// �\�[�g�̎��{
		QuickSort.sort(context, sa, sortmode!=0);
		if (QuickSort.existOldIndexes())
			sortget = QuickSort.getOldIndexes();

		// bs����s�֑��
		for (int i=0; i<s.length; i++) {
			s[i] = sa.toString(i);
		}

		// ���s��؂�ɕϊ�
		op.assign(oi, Scalar.fromValue(Arrays.toString(s).replaceAll("\\[|\\]", "").replaceAll(", ", "\r\n")), 0);
		// �Ō�ɋ�s��ǉ��iHSP3.1�̎d�l�j
		op.assignAdd(oi, Scalar.fromValue("\r\n"), 0);
	}

	/**
	 * CSV�̂P�s��z��ɕϊ�
	 * @param context
	 * @param op ���ʂ��������镶����^�z��ϐ�
	 * @param oi
	 * @param target CSV�̂P�s�����o����������
	 */
	public static void csvnote(final Context context, final Operand op, final int oi, final ByteString target) {

		if (op == null) {
			context.error(HSPError.ParameterCannotBeOmitted, "csvstr");
			return;
		}

		try {
			// ������line���̔��p�J���}�����s�ɕϊ�����o�֑��
			op.assign(0, Scalar.fromValue(target.toString().replaceAll(",", "\n")), 0);
			context.stat.value = 0;
		} catch (Exception e) {
			context.stat.value = 1;
		}
	}

	/**
	 * CSV�̂P�s���������m�[�g�ϊ�
	 * @param context
	 * @param op  ���ʂ��������镶����^�ϐ�
	 * @param oi
	 * @param target CSV�̂P�s�����o����������
	 */
	public static void csvstr(final Context context, final Operand op, final int oi, final ByteString target) {

		if (op == null) {
			context.error(HSPError.ParameterCannotBeOmitted, "csvnote");
			return;
		}
		try {
			// ������line���J���}�ŋ�؂���s[]�Ɋi�[����
			String s[] = target.toString().split(",");
			// Operand�Ɋi�[����
			for(int i=0; i<Math.min(s.length, op.l0()); i++) {
				op.assign(i, Scalar.fromValue(s[i]), 0);
			}
			context.stat.value = 0;
		} catch (Exception e) {
			context.stat.value = 1;
		}
	}

	// -------------------------------------------
	// xnote�`�n
	private static Operand xNote;

	public static void xnotesel(final Context context, final Operand op, final int oi){

		if (op == null) {
			context.error(HSPError.ParameterCannotBeOmitted, "xnotesel", "1st parameter cannot be omitted");
			return;
		}

		// ������^�ւ̕ϊ��Ȃǂ͍s��Ȃ��iHSP3.1���_�ł̎d�l�j
		xNote = op.ref(oi);

		// sortget�̏�����
		sortget = new Vector();
	}

	public static void xnoteadd(final Context context, final ByteString str){

		if (str.indexOf(new ByteString("\n"), 0) != -1) {
			// add���ɉ��s���܂܂�Ă����ꍇ
			// HSP3.1�ł̓G���[�ɂȂ�Ȃ����A�����ɂ͌��ihs�t�@�C���ɖ��L�j�Ȃ̂ŃG���[�i�p�����[�^�̒l���ُ�j�Ƃ���
			context.error(HSPError.InvalidParameterValue, "xnoteadd", "1st parameter cannot be multi line string");
			return;
		}
		if (xNote == null) {
			// xnotesel�����s�̏ꍇ
			// �V�X�e���G���[
			context.error(HSPError.SystemError, "xnoteadd", "please command 'xnotesel' in advance");
			return;
		}
		if (xNote.getType() != Operand.Type.STRING) {
			// xnotesel�Ŏw�肵���ϐ���������^�łȂ������ꍇ
			// �V�X�e���G���[
			context.error(HSPError.SystemError, "xnoteadd", "vartype(xNote)==" + xNote.getType());
			return;
		}

		// ��v���镶����̍s�C���f�b�N�X�i���s�ڂ��j�𒲂ׂ�
		int sameStringIndex = getSameStringIndex(str);

		if (sameStringIndex < 0) {
			// �܂܂�Ă��Ȃ��Ȃ�΍Ō�̗�ɉ�����
			sameStringIndex = -sameStringIndex-1;
			xNote.assignAdd(0, Scalar.fromValue(str), 0);
			xNote.assignAdd(0, Scalar.fromValue("\r\n"), 0);
		}

		context.stat.value = sameStringIndex;
		try {
			sortget.setElementAt(new Integer(objToInt(sortget.get(sameStringIndex))+1), sameStringIndex);
		} catch (ArrayIndexOutOfBoundsException e) {
			setElementAtEx(sortget, sameStringIndex, 1);
		}
	}

	/**
	 * ��v���镶����̍s�C���f�b�N�X�i���s�ڂ��j�𒲂ׂ�
	 * ���`����
	 * @param bs
	 * @return
	 */
	private static int getSameStringIndex(final ByteString bs) {
		int
			result = -1,
			start = 0,
			next = 0,
			lineLength = 0,
			lineNumber = 0;
		ByteString
			xnote = xNote.toByteString(0);

		while (start < xnote.length()) {
			next = xnote.nextLineIndex(start);
			lineLength = next - start;

			// lineNumber�s�ڂ̕�����i���s�ƕ��A���܂ށj
			ByteString line = xnote.substring(start, lineLength);
			// ���s�ƕ��A���폜
			deleteBR(line);

			if (line.compareTo(bs) == 0) {
				// ��v���镶���񂪌��������ꍇ
				result = lineNumber;
				break;
			}
			start = next;
			lineNumber++;
		}

		// ��v���镶����������Ȃ������ꍇ�A(-�Ō�s�̃C���f�b�N�X-1)��Ԃ�
		return result == -1 ? -lineNumber-1 : result;
	}
	/**
	 * �I�[�̉��s�ƕ��A���폜
	 * @param target �Ώۂ̕�����
	 */
	private static void deleteBR(ByteString target) {
		if (target.length() >= 1 && target.get(target.length() - 1) == '\n') {
			target.set(target.length() - 1, (byte) 0);
			if (target.length() >= 1 && target.get(target.length() - 1) == '\r') {
				target.set(target.length() - 1, (byte) 0);
			}
		}
	}

	/**
	 * Vector��index�Ԗڂ�Integer�N���X�̃C���X�^���X����
	 * @param vector �����ł���Vector�N���X�̃C���X�^���X
	 * @param index �����C���f�b�N�X
	 * @param value �������Integer�N���X�̃C���X�^���X���ێ�����l
	 */
	private static void setElementAtEx(final Vector vector, final int index, final int value) {
		vector.ensureCapacity(index + 1);
		while (vector.size() <= index) {
			vector.add(new Integer(0));
		}
		vector.setElementAt(new Integer(value), index);
	}

	// -------------------------------------------
	// csv�`�n ������
	private static Operand csvSel;
	private static Operand csvRes;
	private static ByteString csvSeparator = new ByteString(",");
	private static int csvOption = 0;
	private static Vector csvFlags = new Vector();

	private static final class Option {

		public static final int CCSV_OPT_NOCASE = 1;
		public static final int CCSV_OPT_ANDMATCH = 2;
		public static final int CCSV_OPT_ZENKAKU = 4;
		public static final int CCSV_OPT_ADDLINE = 8;
		public static final int CCSV_OPT_EXPRESSION = 128;
	}

	/**
	 * CSV�����̑Ώۃo�b�t�@��I��
	 * @param context
	 * @param op CSV�����̑Ώۃo�b�t�@
	 * @param oi
	 * @param sep ��؂蕶��
	 * @param sepi
	 */
	public static void csvsel(Context context, Operand op, final int oi, final Operand sep, final int sepi) {

		final ByteString defaultSeparator = new ByteString(",");
		if (op == null) {
			context.error(HSPError.ParameterCannotBeOmitted, "csvsel");
			return;
		}

		csvSel = op.ref(oi);
		// ��؂蕶���̎w��i�f�t�H���g�͔��p�J���}�j
		byte[] separator = {(byte)toInt(sep, sepi, defaultSeparator.get(0))};
		csvSeparator = new ByteString(separator, 0, false);
	}

	/**
	 * CSV�����̌��ʏo�̓o�b�t�@���w��
	 * @param context
	 * @param op ���ʏo�͐�ϐ�
	 * @param oi
	 */
	public static void csvres(Context context, Operand op, final int oi) {

		if (op == null) {
			context.error(HSPError.ParameterCannotBeOmitted, "csvres");
			return;
		}

		csvRes = op.ref(oi);
	}

	/**
	 * CSV�����̍��ڃt���O��ݒ�
	 * @param id ����ID
	 * @param val �ݒ�l
	 */
	public static void csvflag(final int id, final int val) {

		setElementAtEx(csvFlags, id, val);
	}

	/**
	 * CSV�����̃I�v�V������ݒ�
	 * @param op �I�v�V�����l
	 * @param oi
	 */
	public static void csvopt(final Operand op, final int oi) {

		csvOption = toInt(op, oi, 0);
	}

	/**
	 * CSV���������s
	 * @param context
	 * @param keyword �����L�[���[�h
	 * @param resMax ���ʏo�͂̍ő吔
	 * @param resMaxi 
	 * @param index ���ʏo�͂̊J�n�C���f�b�N�X
	 * @param indexi
	 */
	public static void csvfind(final Context context, final ByteString keyword, final Operand resMax, final int resMaxi, final Operand index, final int indexi){

		if (csvSel == null || csvRes == null) {
			// csvsel, csvres���w�肳��Ă��Ȃ��ꍇ
			// HSP3.1�ł̓G���[�ɂȂ�Ȃ����A�����ɂُ͈퓮��Ȃ̂ŃG���[�Ƃ���
			context.error(HSPError.SystemError, "csvfind");
			return;
		}

		if (csvSel.getType() != Operand.Type.STRING || csvRes.getType() != Operand.Type.STRING) {
			// csvsel, csvres�őI�������ϐ��̌^��������ȊO�̂Ƃ�
			context.error(HSPError.SystemError, "csvfind");
			return;
		}

		// ������line�����s�ŋ�؂���keywords[]�֑������
		String s[] = keyword.toString().split("\\r\\n|\\n", -1);
		ByteString[] keywords = new ByteString[s.length];
		for(int i=0; i<s.length; i++) {
			keywords[i] = new ByteString(s[i]);
		}
		
		ByteString csv = csvSel.toByteString(0);
		
		int
			csvIndex = 0,
			serchedLine = 0;
		while(csvIndex < csv.length()) {
			// 1�s�����o��
			boolean match = false;
			int
				lineLength = csv.nextLineIndex(csvIndex) - csvIndex,
				lineIndex = 0,
				serchedCol = 0;
			ByteString line = csv.substring(csvIndex, lineLength);
			// ���s�ƕ��A���폜
			deleteBR(line);

			boolean[] matches = new boolean[s.length];
			for (int i=0; i<s.length; i++) {
				matches[i] = false;
			}
			while (lineIndex < line.length()) {
				// 1�Z�������o��
				int cellLength = line.indexOf(csvSeparator, lineIndex);
				if(cellLength == -1) {
					cellLength = line.length() - lineIndex;
				}
				ByteString cell = line.substring(lineIndex, cellLength);
				
				if(csvFlags.size() <= serchedCol || objToInt(csvFlags.get(serchedCol)) != 0) {
					// �t���O��0�ȊO�Ȃ�΂��̃Z���𒲂ׂ�K�v������
					if((csvOption & Option.CCSV_OPT_ANDMATCH) != 0) {
						for (int i=0; i<s.length; i++) {
							matches[i] |= serchCell(cell, keywords[i]);
						}
					} else {
						for(int i=0; i<s.length; i++) {
							if(serchCell(cell, keywords[i])) {
								match = true;
								break;
							}
						}
					}
				}
				serchedCol++;
				lineIndex += cellLength + csvSeparator.length();
			}
			// 1�s���׏I���
			if ((csvOption & Option.CCSV_OPT_ANDMATCH) != 0) {
				match = true;
				for(int i=0; i < s.length; i++) {
					if (!matches[i]) {
						match = false;
						break;
					}
				}
			}
			
			if (match) {
				// �}�b�`����ꍇ��csvRes�֔��f
				if ((csvOption & Option.CCSV_OPT_ADDLINE) != 0) {
					// �I�v�V�����E�s�ԍ���擪�ɕt��
					final ByteString zero = new ByteString("0");
					ByteString header = new ByteString(new Integer(serchedLine).toString().concat(":"));
					while (header.length() < 6){
						header = ByteString.concat(zero, header);
					}
					csvRes.assignAdd(0, Scalar.fromValue("#".concat(header.toString())), 0);
				}
				csvRes.assignAdd(0, Scalar.fromValue(line), 0);
				csvRes.assignAdd(0, Scalar.fromValue("\r\n"), 0);
			}
			serchedLine++;
			csvIndex += lineLength;
		}
	}

	/**
	 * ������cell��keyword���܂ނ��ǂ������ʂ���B
	 * �I�v�V����CCSV_OPT_NOCASE�ECCSV_OPT_ZENKAKU�����CCSV_OPT_EXPRESSION��
	 * �����Ŕ��f�����邱�ƁB
	 * ���o�[�W�����ł̓I�v�V����CCSV_OPT_ZENKAKU�����CCSV_OPT_EXPRESSION�͖��Ή��B
	 * �I�v�V����CCSV_OPT_NOCASE�͑S�p���p��ʂȂ�����B
	 * @param cell �Z���̕�����
	 * @param keyword ��������L�[���[�h
	 * @return �Z�����L�[���[�h���܂ނ��ۂ�
	 */
	private static boolean serchCell(final ByteString cell, final ByteString keyword){
		if((csvOption & Option.CCSV_OPT_NOCASE) != 0) {
			// �啶���������𓯈ꎋ�i�S�p���p��ʂȂ�����j
			ByteString sourceString = new ByteString(cell.toString().toLowerCase());
			ByteString keywordString = new ByteString(keyword.toString().toLowerCase());
			return sourceString.indexOf(keywordString, 0) != -1;
		} else {
			return cell.indexOf(keyword, 0) != -1;
		}
	}

	// -------------------------------------------
	// rndf_�`�n
	//   Mersenne Twister�̃��C�Z���X�����������iCharlotte����Ɋ���!�j�̂ł�����g�p�B
	//   �I���W�i���Fhttp://www.cs.umd.edu/users/seanl/gp/mersenne/MersenneTwister.java
	static Random randomGenerator = new MersenneTwister();

	public static void rndf_ini(Operand seed, final int seedi){
		if(toInt(seed, 0, -1) == -1) {
			randomGenerator.setSeed(System.currentTimeMillis());
		} else {
			randomGenerator.setSeed((long)toInt(seed, 0, -1));
		}
	}

	public static void rndf_get(final Operand o, final int oi){
		
		o.assign(oi, Scalar.fromValue(randomGenerator.nextDouble()), 0);
	}

	public static void rndf_geti(final Operand o, final int oi, final int limit){
		
		o.assign(oi, Scalar.fromValue(randomGenerator.nextInt(limit)), 0);
	}

	// -------------------------------------------
	// getvar�`�n
	//   �������
	public static void getvarid(final Context context, final Operand o, final int oi, final String varname){
		
		context.error(HSPError.UnsupportedOperation, "getvarid");
	}
	
	public static void getvarname(final Context context, final Operand o, final int oi, final int varid){
		
		context.error(HSPError.UnsupportedOperation, "getvarname");
	}
	
	public static void getmaxvar(final Context context, final Operand o, final int oi){
		
		context.error(HSPError.UnsupportedOperation, "getmaxvar");
	}

	// -------------------------------------------
	// vsave, vload�n
	//   �������
	public static void vsave(final Context context, final String filename){
		
		context.error(HSPError.UnsupportedOperation, "vsave");
	}
	
	public static void vload(final Context context, final String filename){
		
		context.error(HSPError.UnsupportedOperation, "vload");
	}
	
	public static void vsave_start(final Context context){
		
		context.error(HSPError.UnsupportedOperation, "vsave_start");
	}
	
	public static void vsave_put(final Context context, final Operand o, final int oi){
		
		context.error(HSPError.UnsupportedOperation, "vsave_put");
	}
	
	public static void vsave_end(final Context context, final String filename){
		
		context.error(HSPError.UnsupportedOperation, "vsave_end");
	}
	
	public static void vload_start(final Context context, final String filename){
		
		context.error(HSPError.UnsupportedOperation, "vload_start");
	}
	
	public static void vload_get(final Context context, final Operand o, final int oi){
		
		context.error(HSPError.UnsupportedOperation, "vload_get");
	}
	
	public static void vload_end(final Context context){
		
		context.error(HSPError.UnsupportedOperation, "vload_end");
	}
}