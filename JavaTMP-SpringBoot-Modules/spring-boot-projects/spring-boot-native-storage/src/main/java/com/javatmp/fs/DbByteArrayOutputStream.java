package com.javatmp.fs;

import java.io.ByteArrayOutputStream;
import java.io.DataOutput;
import java.io.IOException;

public class DbByteArrayOutputStream extends ByteArrayOutputStream {
    public DbByteArrayOutputStream() {
        super();
    }

    public DbByteArrayOutputStream(int size) {
        super(size);
    }

    /**
     * Writes the full contents of the buffer a DataOutput stream.
     */
    public synchronized void writeTo(DataOutput dstr) throws IOException {
        byte[] data = super.buf;
        int l = super.size();
        dstr.write(data, 0, l);
    }
}
