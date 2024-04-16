import difflib
import unidiff
import os

def generate_diff(old_file_path, new_file_path, diff_file_path):
    with open(old_file_path, 'r') as old_file, open(new_file_path, 'r') as new_file:
        old_content = [line.rstrip('\n') + '\n' for line in old_file.readlines()]
        new_content = [line.rstrip('\n') + '\n' for line in new_file.readlines()]
    
    old_name = os.path.basename(old_file_path)
    new_name = os.path.basename(new_file_path)
    
    # 生成差分
    diff = list(difflib.unified_diff(old_content, new_content, fromfile=old_name, tofile=new_name))

    # 将差分写入文件
    with open(diff_file_path, 'w') as file:
        file.writelines(diff)


def apply_diff(patch_file_path, source_file_path):
    # 读取源文件和Patch文件
    with open(patch_file_path, 'r') as patch_file:
        patch = unidiff.PatchSet(patch_file)
    
    # 打开要更新的文件
    with open(source_file_path, 'r') as source_file:
        source_content = source_file.readlines()

    # 应用差分
    updated_content = source_content[:]  # 创建内容的副本
    for patched_file in patch:
        offset = 0
        for hunk in patched_file:
            for line in hunk:
                if line.is_added:
                    updated_content.insert(offset, line.value)
                    offset += 1
                elif line.is_removed:
                    updated_content.pop(offset)
                    offset -= 1

    # 将更新的内容写回文件
    with open(source_file_path, 'w') as source_file:
        source_file.writelines(updated_content)

def reverse_apply_diff(patch_file_path, target_file_path):
    with open(patch_file_path, 'r') as patch_file:
        patch = unidiff.PatchSet(patch_file)

    with open(target_file_path, 'r') as target_file:
        target_content = target_file.readlines()

    # 逆向应用每一个hunk
    updated_content = target_content[:]
    for patched_file in patch:
        offset = 0
        for hunk in patched_file:
            for line in hunk:
                if line.is_added:
                    updated_content.pop(offset)
                    offset -= 1
                elif line.is_removed:
                    updated_content.insert(offset, line.value)
                    offset += 1

    # 写回文件
    with open(target_file_path, 'w') as target_file:
        target_file.writelines(updated_content)

if __name__ == '__main__':

    # 使用示例
    generate_diff('old_file.py', 'new_file.py', 'diff.patch')

    input(" Press any key to continue...")

    # 使用示例
    apply_diff('diff.patch', 'host_file.py')

    input(" Press any key to continue...")

    # 使用示例
    reverse_apply_diff('diff.patch', 'host_file.py')
