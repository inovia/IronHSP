/* HSPDA�ŗ��p���邽�߂̃\�[�g�A���S���Y��
 * �\�[�g�A���S���Y���ɂ�Java�W���̏C���N�C�b�N�\�[�g�iArrays�N���X��sort���\�b�h�j���g�p
 * 2007/12/29 eller ver. 1.0
 * */

package QuickSort;

import java.util.Arrays;
import java.util.Vector;
import hsplet.variable.*;
import hsplet.HSPError;
import hsplet.Context;
import QuickSort.Container.*;
import QuickSort.Comparator.*;

public class QuickSort {
	private static Container[] containers = null;
	private static Vector oldIndexes = null;

	public static void sort(final Context context, final Operand op, final boolean sortmode) {

		// �ϐ��̌^�ɂ���Ďg�p���郁�\�b�h��؂�ւ���
		switch (op.getType()) {
			case Operand.Type.INTEGER:
				sortInt(op, sortmode);
				break;
			case Operand.Type.DOUBLE:
				sortDouble(op, sortmode);
				break;
			case Operand.Type.STRING:
				sortByteString(op, sortmode);
				break;
			default:
				// ���l�ł͂Ȃ��ꍇ�G���[��Ԃ�
				context.error(HSPError.ParameterTypeMismatch, "sortval", "vartype( op )==" + op.getType());
				break;
		}

		// �ȑO�̃C���f�b�N�X��������Vector�N���X���쐬
		oldIndexes = new Vector(containers.length);
		for (int i=0; i<containers.length; i++) {
			oldIndexes.addElement(new Integer(containers[i].index));
		}
	}

	/**
	 * �����^�z��ϐ��̃\�[�g
	 * @param target �\�[�g���鐔�l�^�z��ϐ�
	 * @param sortmode true�Ȃ�~���Ƀ\�[�g
	 */
	private static void sortInt(final Operand target, final boolean sortmode) {

		containers = new IntContainer[target.l0()];
		for(int i=0; i<target.l0(); i++) {
			containers[i] = new IntContainer(target.toInt(i), i);
		}
		Arrays.sort(containers, new IntComparator());

		// �z��ϐ��Ɍ��ʂ���
		if (sortmode) {
			// �~���Ƀ\�[�g����ꍇ�͏��������ւ���
			for(int i=0; i<target.l0(); i++) {
				target.assign(target.l0() - i - 1, Scalar.fromValue(((IntContainer)containers[i]).value), 0);
			}
		} else {
			for(int i=0; i<target.l0(); i++) {
				target.assign(i, Scalar.fromValue(((IntContainer)containers[i]).value), 0);
			}
		}
	}

	/**
	 * �����^�z��ϐ��̃\�[�g
	 * @param target ���ёւ���z��ϐ�
	 * @param sortmode true�Ȃ�~���Ƀ\�[�g
	 */
	private static void sortDouble(final Operand target, final boolean sortmode) {

		containers = new DoubleContainer[target.l0()];
		for(int i=0; i<target.l0(); i++) {
			containers[i] = new DoubleContainer(target.toDouble(i), i);
		}
		Arrays.sort(containers, new DoubleComparator());

		// �z��ϐ��Ɍ��ʂ���
		if (sortmode) {
			// �~���Ƀ\�[�g����ꍇ�͏��������ւ���
			for(int i=0; i<target.l0(); i++) {
				target.assign(target.l0() - i - 1, Scalar.fromValue(((DoubleContainer)containers[i]).value), 0);
			}
		} else {
			for(int i=0; i<target.l0(); i++) {
				target.assign(i, Scalar.fromValue(((DoubleContainer)containers[i]).value), 0);
			}
		}
	}

	/**
	 * ������^�z��ϐ��̃\�[�g
	 * @param target ���ёւ���z��ϐ�
	 * @param sortmode true�Ȃ�~���Ƀ\�[�g
	 */
	private static void sortByteString(final Operand target, final boolean sortmode) {

		containers = new ByteStringContainer[target.l0()];
		for(int i=0; i<target.l0(); i++) {
			// ByteString�N���X��Cloneable�łȂ��̂�String�N���X�ɕς������̂𗘗p���ăC���X�^���X�𐶐�����
			containers[i] = new ByteStringContainer(
					new ByteString(target.toByteString(i).toString()), i);
		}
		Arrays.sort(containers, new ByteStringComparator());

		// �z��ϐ��Ɍ��ʂ���
		if (sortmode) {
			// �~���Ƀ\�[�g����ꍇ�͏��������ւ���
			for(int i=0; i<target.l0(); i++) {
				target.assign(target.l0() - i - 1, Scalar.fromValue(((ByteStringContainer)containers[i]).value), 0);
			}
		} else {
			for(int i=0; i<target.l0(); i++) {
				target.assign(i, Scalar.fromValue(((ByteStringContainer)containers[i]).value), 0);
			}
		}
	}

	public static boolean existOldIndexes() {

		return oldIndexes != null;
	}

	public static Vector getOldIndexes() {

		return oldIndexes;
	}
}